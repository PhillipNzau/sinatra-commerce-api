class Product < ActiveRecord::Base
    belongs_to :brand
    belongs_to :category
    # Add other associations as needed
  end