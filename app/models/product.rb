class Product < ApplicationRecord

  #Filter functionality for inventory_count
  scope :inventory_count, -> (inventory_count) { where inventory_count: inventory_count }

  #Changes the id parameter to acquire the title parameter to help search items by title and not id number
  #primary key switches from id to title (number to string)
  self.primary_key = 'title'

  #search function for title
  def search(title)
    if title.present?
      #fetches the query matching the title parameter
      Product.where(Product.create_products[:title].matches("#{title}"))
    else
      product = nil
    end
  end

end
