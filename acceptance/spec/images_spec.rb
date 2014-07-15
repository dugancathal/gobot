require 'spec_helper'

describe 'Images' do
  describe '/images/:query' do
    it 'returns an image relating to :query' do
      uri = URI.parse("http://localhost:9999/images/party%20time")
      response = Net::HTTP.get_response(uri)

      expect(response.code).to eq('200')
      expect(response.body.scan(/<img/).count).to eq(1)
    end
  end
end