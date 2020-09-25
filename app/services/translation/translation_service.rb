require 'json'
require 'net/http'
require 'dotenv/load'

module TranslationModule
  class TranslationService

    def initialize(params)
      @target = params['target']
      @source = params['source']
      @text = params['text']
  
      @langs = {
        'Japanese' => 'ja', 'Russo' => 'ru', 'Italiano' => 'it', 'Francês' => 'fr',
        'Inglês' => 'en', 'Espanhol' => 'es', 'Alemão' => 'de', 'Português' => 'pt',
      }
    end
  
    def call
      return "Service disabled..." if ENV['NOT_ACTIVE_SERVICE'].to_i == 0
      result = validate_params
      return "Não conheço este idioma!" if not check_language_exists
      return result if result.class == String
      
      response = create_url
      return formart_message(response)
    end
  
    private
  
      def check_language_exists
        if @source.nil?
          @langs.has_key?(@target)
        else
          @langs.has_key?(@target) && @langs.has_key?(@source)
        end
      end
  
      def formart_message(message) 
        if @source.nil?
          text_formart = "Traduzindo o texto: [ #{ @text } ] para o idioma [ #{ @target } ]"
          text_formart += " fica [ #{message[0]['translatedText']} ]"
        else
          text_formart = "Traduzindo do idioma [ #{ @source } ] o texto: [ #{ @text } ]"
          text_formart += " para o idioma [ #{ @target } ] é [ #{message[0]['translatedText']} ]"
          text_formart
        end
      end
  
      def validate_params
        return 'A language is required' if @target.nil?
        return 'It is required to inform a sentence for translation' if @text.nil?
      end
  
      def create_url
        url = ENV['URL_API']
        key = ENV['API_KEY']
  
        url += "?key=#{key}"
        data = {}
  
        if @source.nil?
          data = {
            "q" => @text,
            "target" => @langs[@target]
          }
        else
          data = {
            "q" => @text,
            "target" => @langs[@target],
            "source" => @langs[@source]
          }
        end

        uri = URI(url)
        res = Net::HTTP.post_form(uri, data)
        result = JSON.parse(res.body)
        result['data']['translations']
      end
  end
end