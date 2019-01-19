class Product < ApplicationRecord

  #Filter functionality for inventory_count
  scope :inventory_count, -> (inventory_count) { where inventory_count: inventory_count }

  #Search functionality by title
  scope :title, -> (title) { where('title LIKE ?', "%#{title}%") }

end
