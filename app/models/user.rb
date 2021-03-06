class User < ActiveRecord::Base
  belongs_to :domain
  validates :user, presence: true
  before_save :hash_password
  default_scope { order(:domain_id) }

  def change_pw
  end

  def hash_password
    self.password = Digest::MD5.hexdigest(self.password)
  end

end
