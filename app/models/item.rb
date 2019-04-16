class Item < ApplicationRecord
    # before_destroy :not_referenced_any_line_item
    default_scope { order('created_at DESC') }

    validates_uniqueness_of :isbn
    validates :item_name, :unit_price, :quantity, presence: true
    validates :unit_price, :quantity, numericality: { only_integer: true }, length: { maximum: 7}
    # validates :chosen_quantity

    validates :desc, length: {maximum: 1000, too_long: "%{count} character is the maximum allowed"}
    validates :item_name, length: {maximum: 140, too_long: "%{count} character is the maximum allowed"}
   
    validates_length_of :isbn, :minimum => 12
    validates_uniqueness_of :isbn
    
    has_many :categorizations
    has_many :categories, :through => :categorizations
    # has_many :line_items
    # belongs_to :cart
    belongs_to :user, optional: true

    has_one_attached :photo
    # mount_uploader :image, ImageUploader
    # serialize :image, JSON #for Sqlite only

    BRAND = %w{ Samson BB Quallity }
    FINISH = %w{ NOUKOD BB Quallity }
    CONDTION = %w{ BALLY BB Quallity }


    def photo?
      errors.add(:base, 'Please upload an image for yout product!') unless photo.attached?
    end

  
end