class Domain < ActiveRecord::Base
  has_many :users
  has_many :aliases
  validates :name, presence: true
  default_scope { order(:name) }
end
