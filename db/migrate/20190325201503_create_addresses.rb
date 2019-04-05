class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
        
    t.string :receiver  
    t.string :street  
    t.binary :country   
    t.string :city   
    t.string :postal_code
    t.string :phone
    t.string :state
    t.string :company
    t.string :street_extra
    t.integer :user_id
    
    t.timestamps
    end
  end
end
