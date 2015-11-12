class Message < ActiveRecord::Base
  has_many :favorites
  has_many :fans, through: :favorites, source: :user

  validates_presence_of :text
end
