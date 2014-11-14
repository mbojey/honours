class Scene < ActiveRecord::Base

        belongs_to :user
        
        validates :creator_id, :created_at, :question, presence: true
end