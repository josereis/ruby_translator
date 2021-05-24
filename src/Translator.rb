require 'rest-client'
require 'json'

class Translator
    attr_accessor :url_api, :key_api, :translation_direction, :source_text
    
    def initialize()
        self.url_api = 'https://translate.yandex.net/api/v1.5/tr.json/translate'
        self.key_api = '<<key authentic>>'
    end
    
    # Returns, in JSON format, the source text for the target language entered
    def translate(source_language, target_language, text)
        self.source_text = text
        self.translation_direction = source_language + '-' + target_language

        return JSON.parse(self.get_response)
    end

    private
    def get_response
        return RestClient.get(self.url_api, params: {
                                                        key: self.key_api, 
                                                        text: self.source_text, 
                                                        lang: self.translation_direction, 
                                                        format: 'plain'}
                            )
    end
end