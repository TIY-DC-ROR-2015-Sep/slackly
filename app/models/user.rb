class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [ :slack ]

  has_many :favorites
  has_many :favorite_messages, through: :favorites, source: :message

  def self.from_omniauth auth
    u = User.where(email: auth.info.email).first_or_initialize
    u.password ||= Devise.friendly_token
    u.slack_data = auth.to_h
    u.save!
    u
  end

  def slack_token
    slack_data["credentials"]["token"]
  end

  def pull_messages room
    s = Slack.new slack_token
    s.messages_from_room(room).each do |m|
      Message.where(text: m["text"]).first_or_create!
    end
  end
end
