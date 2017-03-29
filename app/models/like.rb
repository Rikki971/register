class Like < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :likable, polymorphic: true
end
