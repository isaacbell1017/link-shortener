require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:full_url) }
  describe "slug" do
    it "should auto-generate on creation" do
      link = FactoryBot.create(:link)
      expect(link.slug).not_to be_blank
    end

    it "can be searched with FriendlyId" do
      link = FactoryBot.create(:link)
      expect(
        Link.friendly.find(link.slug)
      ).to eq link
    end
  end

  describe "path" do
    it "should contain correct slug" do
      link = FactoryBot.create(:link)
      expect(link.path).to eq "/s/#{link.slug}"
    end
  end
end
