# frozen_string_literal: true

# Integrational spec for JwtService
RSpec.describe JwtService do
  subject(:service) do
    described_class
  end

  describe '#encode' do
    it 'encodes correctly' do
      expect(service.encode('test')).not_to be_blank
    end
  end

  describe '#decode' do
    it 'decodes correctly' do
      expect(service.decode('test')).not_to be_blank
    end
  end
end
