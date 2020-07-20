module TranslationModule
  class TranslationHelpService
    def self.call
      response = "*Meus Comandos*\n\n"
      response += "help tradução\n"
      response += "Lista de comandos\n"
      response += "Traduza do idioma x para o idioma y\n"
      response += "Traduza a palavra x para o idioma y \n"
      response
    end
  end
end