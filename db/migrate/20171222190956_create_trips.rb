class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.references :from_user, index: true
      t.date :check_in
      t.boolean :validated

      t.timestamps
    end
    add_foreign_key :trips, :users, column: :from_user_id
  end
end
