class SitemapController < ApplicationController
  def show
    url = "https://s3-us-west-2.amazonaws.com/#{ENV['S3_BUCKET']}/sitemaps/sitemap.xml.gz"
    data = open(url)
    send_data data.read, type: data.content_type
  end

  def show_id
    url = "https://s3-us-west-2.amazonaws.com/#{ENV['S3_BUCKET']}/sitemaps/#{sitemap}.xml.gz"
    data = open(url)
    send_data data.read, type: data.content_type
  end

  private

  def sitemap
    param = params[:id].to_i
    id = (0..param).to_a.find { |num| num == param }
    "sitemap#{id}"
  end
end
