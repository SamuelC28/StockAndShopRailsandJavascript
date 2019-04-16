class CategorySerializer < ActiveModel::Serializer
  attributes :category_name
#  has_many :categorizations# (no need)
   has_many :items, :through => :categorizations
end
