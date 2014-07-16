require 'spec_helper'
require 'csv'

describe 'Names' do
  describe '/names' do
    context 'with no params' do
      it 'returns a single name with no params' do
        uri = URI.parse("http://localhost:9999/names")
        response = Net::HTTP.get_response(uri)

        expect(response.code).to eq('200')
        res = JSON.parse(response.body)
        expect(res.length).to eq(1)
        expect(res[0]['name']).to be
      end

      context 'with a limit param' do
        it 'it returns multiple names' do
          uri = URI.parse("http://localhost:9999/names?limit=3")
          response = Net::HTTP.get_response(uri)

          expect(response.code).to eq('200')
          expect(JSON.parse(response.body).length).to eq(3)
        end
      end

      context 'as CSV' do
        it 'returns a flat list of names' do
          uri = URI.parse("http://localhost:9999/names?limit=3")
          request = Net::HTTP::Get.new(uri)
          request['Accept'] = 'text/csv'
          response = Net::HTTP.start(uri.hostname, uri.port) do |http|
            http.request(request)
          end

          expect(response.code).to eq('200')
          expect(CSV.parse(response.body).length).to eq(3)
        end
      end
    end
  end
end
