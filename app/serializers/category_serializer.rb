class CategorySerializer < ActiveModel::Serializer
  attributes :category_name
  # has_many :categorizations
  has_many :items, :through => :categorizations
end
