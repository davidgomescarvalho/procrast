# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grant badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
Rails.application.reloader.to_prepare do
  Merit::Badge.create!(
    id: 1,
    name: '10-projects',
    description: 'Created 10 projects',
    custom_fields: { level: 1, image: 'badge-level-1.png' }
  )

  Merit::Badge.create!(
    id: 2,
    name: '25-projects',
    description: 'Created 25 projects',
    custom_fields: { level: 2, image: 'badge-level-2.png' }
  )

  Merit::Badge.create!(
    id: 3,
    name: '50-projects',
    description: 'Created 50 projects',
    custom_fields: { level: 3, image: 'badge-level-3.png' }
  )

  Merit::Badge.create!(
    id: 4,
    name: '100-projects',
    description: 'Created 100 projects',
    custom_fields: { level: 4, image: 'badge-level-4.png' }
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
