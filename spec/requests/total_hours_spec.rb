RSpec.describe TotalHoursController, type: :controller do
  describe 'GET #index' do
    it 'returns JSON with total hours grouped by day' do
      employee = create(:employee)
      create(:shift, employee: employee, day: 0, duration: 4)
      create(:shift, employee: employee, day: 1, duration: 6)

      get :index

      get :index

      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)

      expect(json_response).to be_a(Hash)
      expect(json_response.keys).to include('0', '1')

      expect(json_response['0']).to eq(4)
      expect(json_response['1']).to eq(6)
    end
  end
end
