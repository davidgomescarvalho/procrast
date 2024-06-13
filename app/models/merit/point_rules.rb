# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      score 10, on: 'users#create', to: 'itself', category: 'project' do |project|
        project.user.update_level_based_on_points
      end

      score 15, on: 'projects#create', to: :user, category: 'project' do |project|
        project.user.update_level_based_on_points
      end

      # Creating a new project
      score 10, on: 'projects#create', to: :user, category: 'project' do |project|
        project.user.update_level_based_on_points
      end

      # Updating a project
      score 5, on: 'projects#update', to: :user, category: 'project' do |project|
        project.user.update_level_based_on_points
      end

      # Completing a project
      score 15, on: 'projects#complete', to: :user, category: 'project' do |project|
        project.user.update_level_based_on_points
      end

      # Losing points for deleting a project
      score -5, on: 'projects#destroy', to: :user, category: 'project' do |project|
        project.user.update_level_based_on_points
      end

      # Bonus points for reaching milestones
      score 20, on: 'projects#create', to: :user, category: 'project' do |project|
        project.user.projects.count == 10
        project.user.update_level_based_on_points
      end

      score 50, on: 'projects#create', to: :user, category: 'project' do |project|
        project.user.projects.count == 50
        project.user.update_level_based_on_points
      end
    end
  end
end
