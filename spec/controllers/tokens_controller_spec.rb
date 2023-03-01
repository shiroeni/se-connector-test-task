# frozen_string_literal: true

RSpec.describe TokensController, type: :request do
  describe '#create' do
    before do
      stub_request(:post, Settings.config.compliance_status_url).to_return(status: 200, body: '{}')
    end

    let(:params) do
      {
        tokens: {
          callback_uri: 'https://example.com/'
        }
      }
    end

    it 'redirects to callback uri' do
      post(tokens_path, params:)

      expect(response).to redirect_to(params[:tokens][:callback_uri])
    end

    it 'creates new record in database' do
      expect { post tokens_path, params: }.to change(Token, :count).by(1)
    end

    context 'when param incorrect' do
      let(:params) do
        {
          tokens: {
            callback_uri: nil
          }
        }
      end

      it 'returns bad request' do
        post(tokens_path, params:)

        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
