class Product < ApplicationRecord

  scope :inventory_count, -> (inventory_count) { where inventory_count: inventory_count }

end
