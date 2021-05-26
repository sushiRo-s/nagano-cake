class Delivery < ApplicationRecord
  
  belongs_to :member
  
  def full_deliveries
    postcode + " " + address + " " + name
  end
  
end
