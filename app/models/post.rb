class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  #Instead of usng this, we created our own writer below!
  # accepts_nested_attributes_for :categories

  def categories_attributes=(categories_hashes)
    # {"0"=>{"name"=>"Sport"}, "1"=>{"name"=>"Leisure"}}
    categories_hashes.each do |index, category_attributes|
      #DO NOT CREATE CATEGORY IF IT DOESN'T EXIST
      if category_attributes[:name].present?

        category = Category.find_or_create_by(name: category_attributes[:name])
        #But also don't add a category to a post if it already has it
        #how to check to check if this post has a category already?
        if !self.categories.include?(category)
          self.post_categories.build(category: category)
        end
      end
    end
  end


end
