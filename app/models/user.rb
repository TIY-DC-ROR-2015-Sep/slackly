class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [ :slack ]

  has_many :favorites
  has_many :favorite_messages, through: :favorites, source: :message

  def self.from_omniauth auth
    User.where(email: auth.info.email).first_or_create! do |u|
      # u.slack_data = auth.to_h
    end
  end
end
