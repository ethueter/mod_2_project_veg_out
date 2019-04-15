class User < ApplicationRecord
  has_many  :reviews
  has_many  :menu_items
  has_many  :restaurants, through: :reviews

  validates :username, presence: {true, message: "User name required."}, uniqueness: {true, message: "Name already taken."}, length: {minimum: 5, message: "Name must be 5 or more characters."}
  validates :email, presence: {true, message: "Email address required."}, uniqueness: {true, message: "User name already exists for this email address."}, unless value =~ {/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Please provide a valid email address so we can <s>spam</s> send you <s>giant piles of garbage</s> offers from our <s>equally garbage advertisers</s> qualified partners."}
  validates :first_name, presence: {true, message "Must provide a first name."}
  validates :last_name, allow_blank: true
  validates :password_digest, presence: true

  def full_name
    self.first_name + " " + self.last_name
  end
end
