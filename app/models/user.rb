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


  # <<<<<<< HEAD
  # def login(email, entered_password)
  #   @user = User.find_by(email: email)
  #   @user.password == entered_password
  # =======
  def authenticate(entered_password)
  	# instance variable or lookup not needed, we are already at user
  	# email cannot be used as variable name here as it is already a method
    # user = User.find_by(email: supplied_email)
    password == entered_password
  end

  def owned_decks
  	owned_decks = []
  	played_cards.all.each {|card| owned_decks << card.deck}
  	owned_decks.uniq
  end

end
