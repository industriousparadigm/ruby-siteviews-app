require_relative 'page_view'

class App
  def initialize(filename)
    @filename = filename
  end

  def run
    read_file
    print_views_count
    print_views_count("unique")
  end

  def read_file
    page_views = []
    File.foreach(@filename) do |line|
      url = line.split[0]
      ip = line.split[1]
      PageView.new(url, ip)
    end
    PageView.all
  end

  def print_views_count(option = "")
    if option == "unique"
      puts "Unique page views, sorted descending"
      PageView.sort_by_unique_views.each do |url, count|
        puts "#{url} #{count} unique views"
      end
    else
      puts "Page views, sorted descending"
      PageView.sort_by_views.each do |url, count|
        puts "#{url} #{count} views"
      end
    end
    puts ""
  end
end