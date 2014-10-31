require 'bcrypt'

class User < ActiveRecord::Base
has_many :turns, foreign_key: :player_id
has_many :played_cards, through: :turns, source: :card
# has_many :played_decks, through: :played_cards, source: :deck

include BCrypt

def password
  @password ||= Password.new(password_hash)
end

def password=(new_password)
  @password = Password.create(new_password)
  self.password_hash = @password
end


def login(email, entered_password)
  @user = User.find_by(email: email)
  @user.password == entered_password
end

end
