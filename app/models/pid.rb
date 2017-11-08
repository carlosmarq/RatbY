class Pid < ApplicationRecord
  validates :hostname, :presence => true
  validates :Name, :uniqueness => true
  belongs_to :server
end
