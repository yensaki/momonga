class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :rememberable, :omniauthable, :trackable, omniauth_providers: [:twitter]

  has_one :user_icon, dependent: :destroy
  has_one :user_social, dependent: :destroy

  def self.find_for_auth(auth)

  end
end
