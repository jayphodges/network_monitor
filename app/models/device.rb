class Device < ApplicationRecord
  validates :name, presence: true
  validates :mac, presence: true, uniqueness: true, length: { maximum: 17 }
  # validates :mac, presence: true, uniqueness: true, length: { maximum: 17 },
  #           format: { with: /[0-9a-f]{2}([-:])[0-9a-f]{2}(\\1[0-9a-f]{2}){4}/,
  #           message: "Invalid MAC format"}

  belongs_to :user
end
