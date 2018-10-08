require 'rails_helper'

RSpec.describe 'increment_clicked_count', type: :request do
  describe "POST #increment_clicked_count" do
    it "raises the clicked link's `stat_clicked_count`" do
      link = FactoryBot.create(:link)
      expect(link.stat_clicked_count).to eq 0

      headers = {
        "ACCEPT" => "application/json",
        'HTTP_REFERER' => 'http://example.com'
      }

      post '/clicked-count',
            params: {
              id: link.id,
              format: 'js'
            },
            headers: headers,
            xhr: true

      expect(link.reload.stat_clicked_count).to eq 1
    end
  end
end
