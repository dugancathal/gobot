require 'spec_helper'

describe 'Carlton' do
  describe '/carlton' do
    it 'returns a picture of Carlton dancing' do
      uri = URI.parse("http://localhost:9999/carlton")
      response = Net::HTTP.get_response(uri)

      expect(response.code).to eq('200')
      expect(response.body.scan(/<img/).count).to eq(1)
    end
  end
end