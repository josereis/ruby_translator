require_relative 'src/SaveFile'
require_relative 'src/Translator'

puts 'Digite o texto que deseja traduzir ::'
source_text = gets.chomp
print 'Digite o idioma do texto digitado (pt, en, fr, es, ru, etc..) :: '
source_language = gets.chomp
print 'Digite o idioma para tradução (pt, en, fr, es, ru, etc..) :: '
target_language = gets.chomp

# Initializes instance of the translator object
translate = Translator.new
# Pass the data for the text and language you want to translate it to, and save the result (JSON format)
response_json = translate.translate(source_language, target_language, source_text)
# Working the text to be saved in the file
target_text = "Idioma origem: #{source_language}\nTexto para tradução :: #{source_text}\n\nTraduzido para o idioma :: #{target_language}\nTexto traduzido :: #{response_json['text']}"
# Save the information to the file
SaveFile.save(target_text)