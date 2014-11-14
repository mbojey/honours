class Action < ActiveRecord::Base

        belongs_to :user
        belongs_to :node
        
        validates :creator_id, :performed_at, presence: true
end