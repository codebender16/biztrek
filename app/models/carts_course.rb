class CartsCourse < ApplicationRecord
  belongs_to :cart
  belongs_to :course
end
