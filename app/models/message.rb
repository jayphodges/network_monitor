class Message < ApplicationRecord
  belongs_to :device

  def self.by_hour
    group_by_hour(:created_at).count
  end
end
