class CreateUserBodyParts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_body_parts do |t|
      t.integer :user_id
      t.integer :body_part_id

      t.timestamps
    end
  end
end
