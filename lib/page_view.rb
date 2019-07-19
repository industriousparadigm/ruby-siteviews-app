class PageView
  attr_reader :url, :ip

  PAGEVIEWS = []

  def initialize(url, ip)
    @url = url
    @ip = ip
    PAGEVIEWS << self
  end

  def self.all
    PAGEVIEWS
  end

  def self.sort_by_views
    # returns a hash with unique URLs and their view count
    sorted = group_by_url.sort_by { |url, ips| -ips.size }
    sorted.map { |url, ips| [url, ips.size] }.to_h
  end

  def self.sort_by_unique_views
    # returns a hash with unique URLs and their UNIQUE view count
    sorted = group_by_url.sort_by { |url, ips| -ips.uniq.size }
    sorted.map { |url, ips| [url, ips.uniq.size] }.to_h
  end

  def self.group_by_url
    # returns a hash with all the IPs associated to each unique URL
    grouped_urls = {}
    all.each do |view|
      if grouped_urls.has_key?(view.url)
        grouped_urls[view.url] << view.ip
      else
        grouped_urls[view.url] = [view.ip]
      end  
    end  
    grouped_urls
  end  


end