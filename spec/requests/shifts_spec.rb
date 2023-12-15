require 'rails_helper'

RSpec.describe ShiftsController, type: :controller do
  describe 'GET #index' do
    let!(:employee1) { create(:employee, first_name: 'Alice', last_name: 'Johnson') }
    let!(:employee2) { create(:employee, first_name: 'Bob', last_name: 'Smith') }

    it 'returns a list of employees sorted by first name in ascending order by default' do
      get :index
      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response.first['first_name']).to eq('Alice')
      expect(json_response.last['first_name']).to eq('Bob')
    end

    it 'returns a list of employees sorted by last name in descending order' do
      get :index, params: { order_by: 'last_name', sort_order: 'desc' }
      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response.first['last_name']).to eq('Smith')
      expect(json_response.last['last_name']).to eq('Johnson')
    end

    it 'returns a list of employees sorted by first name in ascending order' do
      get :index, params: { order_by: 'first_name', sort_order: 'asc' }
      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response.first['first_name']).to eq('Alice')
      expect(json_response.last['first_name']).to eq('Bob')
    end
  end
end
