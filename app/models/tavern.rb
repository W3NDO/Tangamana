class Tavern < ApplicationRecord
    has_many :tavern_members, class_name: "TavernMember"
    has_one :owner, class_name: "User"
    has_many :messages, dependent: :destroy

    after_create_commit {broadcast_prepend_to "taverns"}
    after_update_commit {broadcaste_replace_to "taverns"}
    after_destroy_commit {broadcast_remove_to "taverns"}
end
