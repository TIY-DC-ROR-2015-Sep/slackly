class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :message

  validates_presence_of :user, :message
  validates_uniqueness_of :message, scope: :user
end
