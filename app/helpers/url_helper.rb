require 'open-uri'

module UrlHelper

    def generateShortUrl
        rand(10**6).to_s(36).upcase
    end

    def validateUrl (url)
        begin
            validatedUrl = open(url).status

            if(validatedUrl[0] == '200')
                return true
            end

            return false
        rescue => error
            return false
        end
    end

end