class TavernMember < ApplicationRecord
    belongs_to :tavern, class_name: "Tavern", foreign_key: "tavern_id"
    belongs_to :user, class_name: "User", foreign_key: "user_id"
end
