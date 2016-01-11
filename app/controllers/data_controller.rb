class DataController < ApplicationController
  require 'uri'

  def add_url
    urlParam = params[:url]
    if (urlParam && urlParam =~ URI::regexp)
      url = UrlResource.create(url: params[:url])
    end
  end

  def get_random_url
    if (UrlResource.count.zero?)
      @url = "http://moldedbits.com"
      respond_to do |format|
        format.html { render :get_random_url }
        format.json { render :json=> {:success=>"success", :url=> @url}, :status=>200 }
      end
      return
    end

    urls = UrlResource.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)

    if (urls.count == 0)
      urls = UrlResource.all
    end

    offset = rand(urls.count)
    url = urls.offset(offset).first

    @url = url.url
    respond_to do |format|
      format.html { render :get_random_url }
      format.json { render :json=> {:success=>"success", :url=> @url}, :status=>200 }
    end
  end

  private
    def check_params
      params.require(:url_resource).permit(:url)
    end
end
