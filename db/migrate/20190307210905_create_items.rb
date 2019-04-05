class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.decimal :unit_price, precision: 5, scales: 2, default: 0
      t.integer :quantity
      t.string :isbn
      t.string :desc
      t.string :tax
      t.string :photo
      
      t.integer :user_id
      # t.integer :card_id
      t.timestamps
    end
  end
end

