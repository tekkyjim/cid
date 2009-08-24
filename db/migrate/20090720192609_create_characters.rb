class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters, :force => true do |t|
      t.string :name, :null => false
      t.string :bio, :null => false
      t.integer :user_id, :null => false
      t.integer :city_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
