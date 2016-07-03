class Redirection < ActiveRecord::Base
  belongs_to :domain
  validates :destination, presence: true
  default_scope { order(:destination) }
end
