class OauthAuthentication < ApplicationRecord
  belongs_to :user

  enum provider: %i(twitter)
  serialize :credentials, JSON

  validates :provider, presence: true
  validates :uid, uniqueness: { scope: :provider }

  def self.from_omniauth(data)
    find_or_initialize_by(provider: providers[data.provider], uid: data.uid).tap do |instance|
      instance.user || instance.create_user!
      instance.user.update!(name: data.info[:name])
      user_icon = instance.user.user_icon || instance.user.build_user_icon
      user_icon.url = data.info[:image]
      user_icon.save!
      instance.update!(credentials: data.credentials.to_h)
    end
  end
end
