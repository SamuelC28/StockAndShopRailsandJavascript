class Address < ApplicationRecord
    belongs_to :user
    # validates :user,  presence: true
    # validates :title, :receiver, :street, :country, :state,
    #         :city, :postal_code, presence: true
end
