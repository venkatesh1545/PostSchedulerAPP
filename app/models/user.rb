class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:linkedin]

  has_many :posts
  has_many :linkedin_accounts

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.first_name + " " + auth.info.last_name
    end
  end

  def self.new_with_session(params, session)
    super if session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
    super
  end
end