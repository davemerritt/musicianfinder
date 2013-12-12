class User < ActiveRecord::Base
  has_many :target_references, class_name: "Reference", foreign_key: :target_id
  has_many :source_references, class_name: "Reference", foreign_key: :source_id
   
  authenticates_with_sorcery!

  geocoded_by :postal_code

  acts_as_taggable
  acts_as_taggable_on :genres, :instruments

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :city 
  validates_presence_of :postal_code

  validates :email, uniqueness: true

  after_validation :geocode, :if => :postal_code_changed?
  def full_name
    full_name = first_name.capitalize + " " + last_name.capitalize 
  end 
    
end
