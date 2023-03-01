# frozen_string_literal: true

RSpec.describe TokenInteractions::Validation do
  subject(:interaction) do
    described_class.new(params)
  end

  describe '#call' do
    context 'when valid url' do
      let(:params) do
        {
          callback_uri: 'https://example.com'
        }
      end

      it 'returns success' do
        expect(interaction.call).to be_success
      end
    end

    context 'when invalid url' do
      let(:params) do
        {
          callback_uri: nil
        }
      end

      it 'returns failure' do
        expect(interaction.call).to be_failure
      end
    end
  end
end
