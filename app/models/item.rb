class Item < ApplicationRecord
  belongs_to :box

  validates :box, presence: true
  validates :name, presence: true
end
