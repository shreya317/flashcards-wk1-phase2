class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :turns

  def correct?(guess)
    self.answer == guess
  end

end
