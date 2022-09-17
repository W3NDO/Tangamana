class Message < ApplicationRecord
    belongs_to :tavern, foreign_key: "tavern_id"
    belongs_to :user, foreign_key: "user_id"
end
