class CreateClans < ActiveRecord::Migration
  def self.up
    create_table :clans, :force => true do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_column :characters, :clan_id, :integer
  end

  def self.down
    drop_table :clans
    remove_column :characters, :clan_id
  end
end
