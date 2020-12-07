class User < ApplicationRecord
  has_and_belongs_to_many :stocks, :uniq => true
  has_many :stocks
  has_many :watchlists
  has_many :watched_items, :through => :watchlists
  
  has_secure_password
  validates :first_name,  
            presence: true  
  validates :last_name,  
            presence: true  
  validates :email,  
            presence: true,  
            uniqueness: true,  
            format: {  
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
            }  


  def to_s  
    "#{first_name} #{last_name}"  
  end  
end
