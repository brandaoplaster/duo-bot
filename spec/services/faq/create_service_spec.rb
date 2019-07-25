require '../../../spec/spec_helper.rb'

describe FaqModule::CreateService do
  before do
    @question = FFaker::Lorem.sentence
    @answer = FFaker::Lorem.sentence
    @hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word},"
  end

  describe '#Call' do
    context 'Without hashtag params' do
      it 'Will receive a error' do
        @createService = FaqModule::CreateService.new({"question" => @question, "answer" => @answer})
        response = @createService.call()
        expect(response).to match("Hashtag Required")
      end
    end

    context "With valid params" do
      before do
        @createService = FaqModule::CreateService.new({"question" => @question, "answer" => @answer, "Hashtags" => @hashtags})
        @response = @createService.call()
      end

      it "Receive success message" do
        expect(@response).to match("successfully created")
      end

      it "Question and answer id present in database" do
        expect(Faq.last.question).to match(@question)
        expect(Faq.last.answer).to match(@answer)
      end

      it "Hashtag are created" do
        expect(@hashtags.split(/[\s,]+/).first).to match(Hashtag.first.name)
        expect(@hashtags.split(/[\s,]+/).last).to match(Hashtag.last.name)
      end
    end
  end
end