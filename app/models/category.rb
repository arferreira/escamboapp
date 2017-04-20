class Category < ActiveRecord::Base
  validates :description, presence: true
end
