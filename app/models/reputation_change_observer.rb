class ReputationChangeObserver
  def update(changed_data)
    if changed_data[:category] == 'merit'
      handle_merit_change(changed_data)
    end
  end

  private

  def handle_merit_change(changed_data)
    if changed_data[:type] == 'badge'
      handle_badge_change(changed_data)
    elsif changed_data[:type] == 'points'
      handle_points_change(changed_data)
    end
  end

  def handle_badge_change(changed_data)
    badge_id = changed_data[:badge_id]
    user_id = changed_data[:sash_id]

    if user_id && badge_id
      user = User.find_by(id: user_id)
      badge = Merit::Badge.find_by(id: badge_id)

      if user && badge
        message = "You earned the badge: #{badge.name}"
        user.notifications.create(message: message, read: false)
        Rails.logger.info("User #{user.id} earned badge: #{badge.name}")
        # Add custom logic for handling badge change
      else
        Rails.logger.error("User or badge not found for user_id: #{user_id}, badge_id: #{badge_id}")
      end
    else
      Rails.logger.error("Missing user_id or badge_id in changed_data: #{changed_data}")
    end
  end

  def handle_points_change(changed_data)
    user_id = changed_data[:sash_id]
    points = changed_data[:value]

    if user_id && points
      user = User.find_by(id: user_id)

      if user
        message = "You now have #{points} points"
        user.notifications.create(message: message, read: false)
        Rails.logger.info("User #{user.id} now has #{points} points")
        user.update_level_based_on_points
        # Add custom logic for handling points change
      else
        Rails.logger.error("User not found for user_id: #{user_id}")
      end
    else
      Rails.logger.error("Missing user_id or points in changed_data: #{changed_data}")
    end
  end
end
