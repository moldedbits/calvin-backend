class DataController < ApplicationController

  def add_url
    url = UrlResource.create(url: params[:url])
  end

  def get_random_url
    if (UrlResource.count.zero?)
      @url = "http://moldedbits.com"
      return
    end

    urls = UrlResource.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)

    if (urls.count == 0)
      urls = UrlResource.all
    end

    offset = rand(urls.count)
    url = urls.offset(offset).first

    @url = url.url
  end

  private
    def check_params
      params.require(:url_resource).permit(:url)
    end
end
