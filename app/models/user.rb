class User < ApplicationRecord
  has_many  :reviews
  has_many  :menu_items
  has_many  :restaurants, through: :reviews

  has_secure_password

  validates :username, presence: true, uniqueness: true, length: {minimum: 5}
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates_confirmation_of :password

  def full_name
    self.first_name + " " + self.last_name
  end
end
