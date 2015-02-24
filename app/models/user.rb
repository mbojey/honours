class User < ActiveRecord::Base

  has_many :dragActions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 
  validates :username, uniqueness: true

  validates :username, :fname, :lname, :lab, :studentnumber,  presence:  true
    
  private

    def self.find_for_database_authentication(conditions={})
      self.where("username = ?", conditions[:email]).limit(1).first ||
      self.where("email = ?", conditions[:email]).limit(1).first
    end
end