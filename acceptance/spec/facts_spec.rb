require 'spec_helper'

describe 'Facts' do
  describe '/facts/cat' do
    it 'returns a cat fact' do
      uri = URI.parse("http://localhost:9999/facts/cat")
      response = Net::HTTP.get_response(uri)

      expect(response.code).to eq('200')
      expect(JSON.parse(response.body)['fact'].length).to be > 10
    end
  end
end