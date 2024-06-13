# Use this hook to configure merit parameters
require "reputation_change_observer"

Merit.setup do |config|
  # Check rules on each request or in background
  config.checks_on_each_request = true

  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  config.add_observer 'ReputationChangeObserver'

  # Define :user_model_name. This model will be used to grant badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
  config.add_observer = "ReputationChangeObserver"
end


# Create application badges (uses https://github.com/norman/ambry)
Rails.application.reloader.to_prepare do
  Merit::Badge.create!(
    id: 1,
    name: "just-registered",
    description: "Welcome to the community!",
    custom_fields: { difficulty: :silver },
    custom_fields: { image: 'badges/just-registered.png'}
  )

  Merit::Badge.create!(
    id: 2,
    name: "best-unicorn",
    description: "You're the best unicorn!",
    custom_fields: { difficulty: :gold }
  )

  Merit::Badge.create!(
    id: 3,
    name: "first-project",
    description: "You've created your first project!",
    custom_fields: { difficulty: :bronze }
  )

  Merit::Badge.create!(
    id: 4,
    name: "prolific-project-creator",
    description: "You've created 10 projects!",
    custom_fields: { difficulty: :silver }
  )

  Merit::Badge.create!(
    id: 5,
    name: "master-project-creator",
    description: "You've created 50 projects!",
    custom_fields: { difficulty: :gold }
  )

  Merit::Badge.create!(
    id: 6,
    name: "first-project-completed",
    description: "You've completed your first project!",
    custom_fields: { difficulty: :bronze }
  )

  Merit::Badge.create!(
    id: 7,
    name: "prolific-project-completer",
    description: "You've completed 10 projects!",
    custom_fields: { difficulty: :silver }
  )

  Merit::Badge.create!(
    id: 8,
    name: "master-project-completer",
    description: "You've completed 50 projects!",
    custom_fields: { difficulty: :gold }
  )

end
#   badge_id = 0
#   [{
#     id: (badge_id = badge_id+1),
#     name: 'just-registered'
#   }, {
#     id: (badge_id = badge_id+1),
#     name: 'best-unicorn',
#     custom_fields: { category: 'fantasy' }
#   }].each do |attrs|
#     Merit::Badge.create! attrs
#   end
# end
