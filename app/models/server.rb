class Server < ApplicationRecord
  validates :hostname, :presence => true, :uniqueness => true
end
