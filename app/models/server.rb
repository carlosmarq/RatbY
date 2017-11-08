class Server < ApplicationRecord
  validates :hostname, :presence => true, :uniqueness => true
  has_many :user
  has_many :pid
  has_many :network
end
