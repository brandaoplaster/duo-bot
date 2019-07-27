module FaqModule
  class RemoveService
    def initialize(params)
      @params = params
      @id = params["id"]
    end

    def call
      faq = Faq.where(id: @id).last
      return "Invalid question, check Id" if faq == nil

      #Delete associated tags not associated with other faqs
      Faq.transaction do
        faq.hashtags.each do |h|
          if h.faqs.count <= 1
            h.delete
          end
        end
        faq.delete
        "Successfully deleted"
      end
    end
  end
end