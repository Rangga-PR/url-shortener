class UrlController < ApplicationController
    skip_before_action :verify_authenticity_token
    include UrlHelper

    @@error = {:message => "invalid url"}

    def shortenUrl
        urlIsValid = validateUrl(params[:url])
        if urlIsValid
            shortUrl = generateShortUrl()
            @newData = Url.create({:short_url => shortUrl, :original_url => params[:url]})
            session[:shortenUrl].push(@newData.as_json)
            redirect_to home_path
        else
            render :json => @@error, :status => 400
        end
    end

    def getOriginalUrl
        originalUrl = Url.where({:short_url => params[:url]}).as_json
        if originalUrl.length > 0
            redirect_to(originalUrl[0]['original_url'])
        else
            redirect_to home_path
        end
    end

end
