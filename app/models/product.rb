class Product < ActiveRecord::Base
    belongs_to :brand
    has_and_belongs_to_many :categories
    # Add other associations as needed
  end