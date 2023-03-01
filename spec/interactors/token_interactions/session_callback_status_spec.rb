# frozen_string_literal: true

RSpec.describe TokenInteractions::SessionCallbackStatus do
  subject(:interaction) do
    described_class.new(params)
  end

  describe '#call' do
    let(:params) { 'new_status' }

    before do
      stub_request(:post, Settings.config.compliance_status_url).to_return(status: 200, body: '{}')
    end

    it 'returns success' do
      expect(interaction.call).to be_success
    end
  end
end
