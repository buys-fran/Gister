require 'rails_helper'

RSpec.describe 'HomeController', type: :request do
  describe '.index' do
    context 'when visited by a guest' do
      it 'redirects with status 302' do
        get root_path
        expect(response.status).to eq(302)
      end
    end

    context 'when logged in' do
      it 'returns status 200' do
        user = create(:user)
        sign_in user
        get root_path
        expect(response.status).to eq(200)
      end
    end
  end
end
