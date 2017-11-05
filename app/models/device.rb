class Device < ApplicationRecord
  validates :name, presence: true
  validates :mac, presence: true, uniqueness: true
  
  belongs_to :user
end
