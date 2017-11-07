class Message < ApplicationRecord
  belongs_to :device

  def self.by_hour
    group_by_hour(:created_at).count
  end

  def self.by_month
    Message.group_by_hour("messages.created_at::date").count
  end
end
