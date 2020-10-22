class Task < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence:true
  validates :target_at, presence:true
end
