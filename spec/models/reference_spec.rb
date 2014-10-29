require 'rails_helper'

describe Reference do
  let(:source_user) { FactoryGirl.create(:user) }
  before do
    @reference = source_user.target_references.build(comment: "comment",
                                              feedback_value: 0,
                                              source_id: source_user.id,
                                              target_id: source_user.id + 1,
                                              jammed: true,
                                              performed: false)
  end

  subject { @reference }

  it { should respond_to(:comment) }
  it { should respond_to(:source_id) }
  it { should respond_to(:target_id) }
  it { should respond_to(:feedback_value) }
  it { should respond_to(:jammed) }
  it { should respond_to(:performed) }
  it { should respond_to(:recorded) }

  it { should be_valid }

  describe "with a blank comment" do
    before { @reference.comment = '' }
    it { should_not be_valid }
  end

  describe "when source_id is not present" do
    before { @reference.source_id = nil }
    it { should_not be_valid }
  end

  describe "when target_id is not present" do
    before { @reference.target_id = nil }
    it { should_not be_valid }
  end

  describe "feedback_textifier" do
    it "should provide textual output" do
      expect(@reference.feedback_textifier).to eq "Neutral"
    end
  end

  describe "check" do
    it "should provide symbols based on boolean values" do
      expect(@reference.check("jammed")).to eq "✓"
      expect(@reference.check("performed")).to eq "✗"
    end
  end
end