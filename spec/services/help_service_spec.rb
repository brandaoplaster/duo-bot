require '../../spec/spec_helper.rb'

describe HelpService do
  describe '#Call' do
    it "Response have the main commands" do
      response = HelpService.call()
      expect(response).to match('help')
      expect(response).to match('add ao Faq')
      expect(response).to match('Remova ID')
      expect(response).to match('What do you know about X')
      expect(response).to match('Search a hashtag X')
      expect(response).to match('Question and Answer')
    end
  end
end