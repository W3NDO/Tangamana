class Tavern < ApplicationRecord
    has_many :tavern_members, class_name: "TavernMember"
    has_one :owner, class_name: "User"
    has_many :messages, dependent: :destroy
end
