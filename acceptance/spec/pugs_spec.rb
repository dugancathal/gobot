require 'spec_helper'

describe 'Pugs' do
  describe '/pugs/random' do
    it 'returns a single pug' do
      uri = URI.parse("http://localhost:9999/pugs/random")
      response = Net::HTTP.get_response(uri)

      expect(response.code).to eq('200')
      expect(response.body.scan(/<img/).count).to eq(1)
    end
  end

  describe '/pugs/bomb/:count' do
    it 'returns :count pugs' do
      uri = URI.parse("http://localhost:9999/pugs/bomb/4")
      response = Net::HTTP.get_response(uri)

      expect(response.code).to eq('200')
      expect(response.body.scan(/<img/).count).to eq(4)
    end
  end
end