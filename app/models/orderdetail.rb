class Orderdetail < ApplicationRecord


    # belongs_to :order
    # belongs_to :item
      
    # validates :order_id, client_id, :item_id, :quantity, :unit_price, presence: true
      
    # scope :by_week, lambda{ where('created_at > ?', Time.now-7.days)  }
    # scope :by_day, lambda{ where('created_at > ?', Time.now-1.days)  }
      
end
