class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :turns

  def check_guess(user_guess)
    self.answer == user_guess
  end

end
