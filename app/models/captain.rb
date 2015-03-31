class Captain < ActiveRecord::Base
  include BCrypt

  has_one :ship
  has_many :crew_members, through: :ship

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name,     presence: true

  def password=(plain_password)
    self.password_hashy_digest = Password.create(plain_password)
  end

  def password
    @password ||= Password.new(self.password_hashy_digest)
  end

  def self.authenticate(username, password)
    captain = Captain.find_by(username: username)
    captain if captain && captain.password == password
  end
end
