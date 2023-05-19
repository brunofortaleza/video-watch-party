class Room < ApplicationRecord

  has_many :messages
  has_many :comments

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def increment_views_count
    self.views += 1
    save
  end
end
