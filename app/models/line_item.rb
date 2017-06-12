class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product
  belongs_to :cart

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

end
