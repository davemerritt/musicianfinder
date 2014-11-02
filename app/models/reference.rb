class Reference < ActiveRecord::Base
  belongs_to :source, :class_name => "User"
  belongs_to :target, :class_name => "User"
  default_scope -> { order('created_at DESC') }
  validates_presence_of :feedback_value, message: "rating must be selected"

  validates_presence_of :comment, :source_id, :target_id
  validates :source_id, uniqueness: { scope: :target_id, message: "You may only write one reference per user. You may manage your references from your home page" }
  validate :check_self_reference

  def check_self_reference
    errors.add(:base, "You can't leave a reference for yourself") if source_id == target_id
  end

  def feedback_textifier
    case feedback_value
    when 1
      return "Positive"
    when 0
      return "Neutral"
    when -1
      return "Negative"
    end
  end

  def check(type)
    case self.send(type.to_sym)
    when true
      return "✓"
    else
      return "✗"
    end
  end
end