require 'uri'
require 'json'
require 'rest-client'
require 'dotenv/load'

module TranslationModule
  class TranslationService

    def initialize(params)
      @languagem = params['languagem']
      @text = params['text']
    end
  
    def call
      return "Serviço desativado..." if ENV['ACTIVE_SERVICE'].to_i == 1
  
      result = validate_params
      return result if result.class == String
      begin
        response = create_url
        return formart_message(response)
      rescue RestClient::ExceptionWithResponse => exception
        exception.response
      end
    end
  
    private
      def formart_message(message)
        langs = {
          'ja' => 'Japanese', 'ru' => 'Russo', 'it' => 'Italiano', 'fr' => 'Francês',
          'en' => 'Inglês', 'es' => 'Espanhol', 'de' => 'Alemão', 'pt' => 'Português',
        }
        text_formart = "Traduzindo do idioma *#{ langs[@languagem['source']] }* o texto: *#{ @text }*"
        text_formart += " para o idioma *#{ langs[@languagem['target']] }* é *#{message[0]['translatedText']}*"
        text_formart
      end
  
      def validate_params
        return 'É obrigatório informar um idioma' if @languagem.nil?
        return 'É obrigatório informar uma senteça para tradução' if @text.nil?
      end
  
      def create_url
        url = ENV['URL_API']
        key = ENV['API_KEY']
  
        url += "?key=#{key}"
        data = {}
  
        if @languagem.length == 1
          data = {
            "q" => @text,
            "target" => @languagem['target']
          }
        else
          data = {
            "q" => @text,
            "target" => @languagem['target'],
            "source" => @languagem['source']
          }
        end
  
        uri = URI.parse(url)
  
        request = RestClient.post(uri.to_s, data)
        result = JSON.parse(request.body)
        result['data']['translations']
      end
  end
end