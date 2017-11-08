class Network < ApplicationRecord
  validates :hostname, :presence => true
  validates :Caption, :uniqueness => true
  belongs_to :server
end
