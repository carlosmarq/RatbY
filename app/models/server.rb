class Server < ApplicationRecord
  validates :hostname, :presence => true, :uniqueness => true
  has_many :user
end
