class User < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:first_name, :last_name, :city, :bio, :looking_for]
  scope :all_except, ->(user) { where.not(id: user) }

  has_many :target_references, class_name: "Reference", foreign_key: :target_id
  has_many :source_references, class_name: "Reference", foreign_key: :source_id

  has_many :invitations
  has_many :invitations_received, class_name: "Invitation", foreign_key: :recipient_id
  has_many :invitations_sent, class_name: "Invitation", foreign_key: :user_id

  has_attached_file :avatar, :styles => {
                    :medium => "300x300>",
                    :thumb => "100x100>",
                    :mini => "30x30" }, :default_url => "/images/:attachment/missing_:style.png"

  before_validation { :smart_add_url_protocol }
  before_validation { self.postal_code = postal_code.upcase }

  before_save { self.email = email.downcase }

  validates_confirmation_of :password

  validates_length_of :password, :minimum => 6, :allow_blank => false, on: [:create, :update]
  validates_length_of :first_name, :maximum => 35
  validates_length_of :last_name, :maximum => 35

  validates_presence_of :postal_code

  validates_presence_of :genre_list
  validates_presence_of :instrument_list

  validates_format_of :first_name, :with => /[a-z]/
  validates_format_of :last_name, :with => /[a-z]/
  validates_format_of :postal_code, :with => /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}\z/

  validates_presence_of :email
  validates_uniqueness_of :email
  after_validation :geocode, :if => :postal_code_changed?

  authenticates_with_sorcery!
  geocoded_by :postal_code

  acts_as_taggable
  acts_as_taggable_on :genres, :instruments

  def full_name
    if first_name.present? && last_name.present?
      full_name = (first_name.capitalize + " " + last_name.capitalize)
    end
  end

  def smart_add_url_protocol
    if personal_url.present?
      personal_url = "http://#{personal_url}" unless personal_url[/\Ahttps?:\/\//]
    end
  end
end
