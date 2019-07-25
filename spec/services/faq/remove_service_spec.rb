require '../../../spec/spec_helper.rb'

describe FaqModule::RemoveService do
  describe '#Call' do
    context "Valid ID" do
      before do
        faq = create(:faq)
        @removeService = FaqModule::RemoveService.new({"id" => faq.id})
      end

      it "Return success message" do
        response = @removeService.call()
        expect(response).to match("Delete successfully")
      end

      it "Remove faq from database" do
        expect(Faq.all.count).to aq(1)

        response = @removeService.call()

        expect(Faq.all.count).to aq(0)
      end
    end

    context "Invalid ID" do
      it "Return error message" do
        @removeService = FaqModule::RemoveService.new({"id" => rand(1..9999)})

        response = @removeService.call()

        expect(response).to match("Invalid question check ID")
      end
    end
  end
end