class HelpService
  def self.call
    response  = "**Meus comandos** \n\n"
    response += "1. help\n"
    response += "Lista de comandos que eu conheço\n\n"
    response += "2 .Adicione ao Faq\n"
    response += "Adiciona uma nova questão ao Faq\n\n"
    response += "3. Remova ID\n"
    response += "Remove uma questão baseada no ID dela\n\n"
    response += "4. O que você sabe sobre X\n"
    response += "Pesquisa por palavra na lista de perguntas e respostas\n\n"
    response += "5. Pesquise a hashtag X\n"
    response += "Lista as perguntas e respostas com aquela hashtag\n\n"
    response += "6. Perguntas e Respostas\n"
    response += "Mostra a lista de perguntas e respostas\n\n"
    response += "7. Traduzir palavras para os seguintes idiomas\n\n"
    response += "Japanese, Russo, Italiano, Francês, Inglês, Espanhol, Alemão, Português\n\n"
    response += "Traduzir a **palavra** para o **idioma**\n\n"
    response += "Traduzir a **palavra** do **idioma** para **idioma**\n\n"

    response
  end
end