class Node < ActiveRecord::Base

    belongs_to :user
    belongs_to :scene
    
    validates :creator_id, :created_at, :scene_id, presence: true
end