require 'spec_helper'

describe 'WhizClient::India' do

  include RequestHelper

  context 'When APP_KEY is defined' do

    before(:each) do
      stub_const('WhizClient::Client::INDIAN_API_URL', 'https://example.com/')
      stub_const('WhizClient::Client::APP_KEY', 'xxxxxxxxxxx')
    end

    context '.list_all_states' do
      it 'returns an array' do
        stub_request(:get, "https://example.com/indian-states-list?AppKey=xxxxxxxxxxx").
           with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => valid_response(:states), :headers => {})

        expect(WhizClient::India.list_all_states).to be_a_kind_of Array
      end
    end

    context '.find_city_by_state' do
      it 'returns an array' do
        fake_response = '{"ResponseCode":0,"ResponseMessage":"OK","ResponseDateTime":"11/7/2014 9:40:15 AM GMT","Data":[{"city":"Adoor","State":"Kerala"},{"city":"Akathiyoor","State":"Kerala"}]}'

        stub_request(:get, "https://example.com/indian-city-by-state?AppKey=xxxxxxxxxxx&stateid=9").
           with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => fake_response, :headers => {})

        expect(WhizClient::India.find_city_by_state(9)).to be_a_kind_of Array
      end
    end

    context '.find_city_by_std_codes' do
      it 'returns an array' do
        fake_response = '{"ResponseCode":0,"ResponseMessage":"OK","ResponseDateTime":"11/7/2014 9:40:15 AM GMT","Data":[{"city":"Adoor","State":"Kerala"},{"city":"Akathiyoor","State":"Kerala"}]}'

        stub_request(:get, "https://example.com/city-from-std-codes?AppKey=xxxxxxxxxxx&code=33").
           with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => fake_response, :headers => {})

        expect(WhizClient::India.find_city_by_std_codes('33')).to be_a_kind_of Array
      end
    end

    context '.find_std_codes_by_location' do
      it 'returns an array' do
        fake_response = '{"ResponseCode":0,"ResponseMessage":"OK","ResponseDateTime":"11/7/2014 9:40:15 AM GMT","Data":[{"city":"Adoor","State":"Kerala"},{"city":"Akathiyoor","State":"Kerala"}]}'

        stub_request(:get, "https://example.com/indian-std-codes?AppKey=xxxxxxxxxxx&search=Calcutta").
           with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => fake_response, :headers => {})

        expect(WhizClient::India.find_std_codes_by_location('Calcutta')).to be_a_kind_of Array
      end
    end

    context '.find_city_by_postal_code' do
      it 'returns an array' do
        fake_response = '{"ResponseCode":0,"ResponseMessage":"OK","ResponseDateTime":"11/7/2014 9:40:15 AM GMT","Data":[{"city":"Adoor","State":"Kerala"},{"city":"Akathiyoor","State":"Kerala"}]}'

        stub_request(:get, "https://example.com/indian-city-by-postal-code?AppKey=xxxxxxxxxxx&pin=700054").
           with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => fake_response, :headers => {})

        expect(WhizClient::India.find_city_by_postal_code('700054')).to be_a_kind_of Array
      end
    end

    context '.find_postal_code_by_location' do
      it 'returns an array' do
        fake_response = '{"ResponseCode":0,"ResponseMessage":"OK","ResponseDateTime":"11/7/2014 9:40:15 AM GMT","Data":[{"city":"Adoor","State":"Kerala"},{"city":"Akathiyoor","State":"Kerala"}]}'

        stub_request(:get, "https://example.com/indian-postal-codes?AppKey=xxxxxxxxxxx&search=kolkata").
           with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => fake_response, :headers => {})

        expect(WhizClient::India.find_postal_code_by_location('kolkata')).to be_a_kind_of Array
      end
    end
  end

  context 'When APP_KEY is uninitialized' do
    it 'raise exception' do
      expect{ WhizClient::India.list_all_states }.to raise_error WhizClient::WhizResponseError
    end
  end
end

