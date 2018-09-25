class Post < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments

  has_many :post_categories
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories

  def categories_attributes=(attributes)
    attributes.values.each do |params|
      self.categories << Category.find_or_create_by(params)
    end
  end

end
