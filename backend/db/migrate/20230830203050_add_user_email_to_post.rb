class AddUserEmailToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, foreign_key: true
    add_column :posts, :user_email, :string
  end
end
