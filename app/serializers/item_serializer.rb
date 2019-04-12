class ItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :photo_url, :item_name, :unit_price, :tax, :quantity, :isbn, :desc
  # belongs_to :category#, serializer: CategorizationSerializer
  has_many :categorizations
    has_many :categories, :through => :categorizations

  def photo_url
    variant = object.photo.variant(resize: "100x100")
    return rails_blob_path(object.photo, only_path: true)
  end
 
end
