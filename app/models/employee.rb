class Employee < ApplicationRecord
  has_many :shifts

  validates :first_name, :last_name, presence: true
end
