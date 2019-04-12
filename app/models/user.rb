class User < ApplicationRecord
    has_secure_password
    validates :fullname, :email, :password, presence: true
    validates :email, uniqueness: true, :case_sensitive => false #, message: 'has already taken, choice not avaible!'
  
    has_many :items
    # has_one :cart
    # has_many :categories 


    # validates_uniqueness_of :category_name, :case_sensitive => false, message: 'has already taken'
    # validates_format_of :category_name, :with => /[a-zA-Z]/, message: 'There should be at least one character.'
    # validates :category_name, presence: true
  
  
end
