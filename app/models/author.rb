class Author < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :mobile, presence: true
  validates :domain, presence: true, uniqueness: true
  validates :description, presence: true
end
