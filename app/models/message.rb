class Message < ApplicationRecord
    belongs_to :tavern
    belongs_to :user
end
