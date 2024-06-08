class AddAvatarToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :avatar, :string, null: false, default: "https://res.cloudinary.com/dq7l8216n/image/upload/v1633836824/avatars/default_avatar.png"
  end
end
