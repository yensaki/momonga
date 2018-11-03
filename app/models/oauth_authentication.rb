class OauthAuthentication < ApplicationRecord
  belongs_to :user

  enum provider: %i(twitter)
  serialize :credentials, JSON

  validates :provider, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.from_omniauth(data)
    find_or_initialize_by(provider: providers[data.provider], uid: data.uid).tap do |instance|
      instance.user || instance.create_user!
      instance.update!(credentials: data.credentials.to_h)
    end
  end
end
