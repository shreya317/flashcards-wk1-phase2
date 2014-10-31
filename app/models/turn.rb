class Turn < ActiveRecord::Base
  belongs_to :player, class_name: "User"
  belongs_to :card
end
