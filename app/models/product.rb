class Product < ApplicationRecord

  #Filter functionality for inventory_count
  scope :inventory_count, -> (inventory_count) { where inventory_count: inventory_count }

  #Search functionality by title
  scope :title, -> (title) { where('title LIKE ?', "%#{title}%") }

  #Function to decrease inventory_count on successful purchase
  def decrease_inventory_count
    if inventory_count > 0
      update(:inventory_count => inventory_count - 1)
    else
      inventory_count
    end
  end

end
