class AddSlackDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slack_data, :json
  end
end
