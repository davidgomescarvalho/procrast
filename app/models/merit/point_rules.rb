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
      # Creating a new project
      score 20, to: :user, on: 'projects#create'

      # Deleting a project
      score -10, to: :user, on: 'projects#destroy'

      # Completing a project
      score 50, to: :user, on: 'projects#complete'

      # Creating a new task
      score 1, to: :user, on: 'tasks#create'

      # Deleting a task
      score -1, to: :user, on: 'tasks#destroy'

      # Completing a task
      score 5, to: :user, on: 'tasks#complete'
    end
  end
end
