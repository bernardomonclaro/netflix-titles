require 'rails_helper'

describe 'Netflix', type: :request do
  # GET
  describe 'GET /netflixes' do
    it 'return all datas and status code 200 OK' do
      get '/netflixes'
      expect(response.body).not_to be_empty
      expect(response).to have_http_status(:ok)
    end
  end

  # POST
  describe 'POST /netflixes' do
    context 'when the request is valid and have duplicate data' do
      let(:new_data) do
        {
          title: 'Tropa de ELite',
          show_type: 'TV Show',
          release_year: '2007',
          country: 'Brazil',
          date_added: 'March 25, 2015',
          description: 'Lorem Ipsummm.'
        }
      end

      it 'return status code 201 created' do
        post '/netflixes', params: new_data, as: :json
        expect(response).to have_http_status(:created)
      end
    end
  end

  # DELETE
  describe 'DELETE /netflixes/:id' do
    it 'returns status code 204' do
      data = Netflix.create!(title: 'Teste')
      delete "/netflixes/#{data.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
