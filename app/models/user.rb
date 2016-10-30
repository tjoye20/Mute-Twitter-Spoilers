class User < ApplicationRecord
  has_many :phrases, dependent: :destroy
  has_many :followers, through: :phrases, dependent: :destroy

  validates_presence_of :username, :token, :secret
  validates_uniqueness_of :username, :token, :secret
  validates_length_of :token, :secret, minimum: 5, too_short: "This entry is too short."

  protected

  def self.create_user(auth_hash)
    User.create(
    username: auth_hash.info.nickname,
    token: auth_hash.credentials.token,
    secret: auth_hash.credentials.secret
    )
  end

end
