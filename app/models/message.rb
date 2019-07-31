class Message < ApplicationRecord
  validates_presence_of :recipient_id, :content
  belongs_to :user
end
