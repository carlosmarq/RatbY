class User < ApplicationRecord
  validates :hostname, :presence => true
  belongs_to :server
end
