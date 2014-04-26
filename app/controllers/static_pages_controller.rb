require 'open-uri'
class StaticPagesController < ApplicationController
  def home
    pages = []
    [1,2,3,5,6].each { |i| pages << Nokogiri::HTML(open("http://rosefench.net/news.php?lb=#{i}")) }
    @lists = []
    pages.each do |page|
      @lists << page.css('.line a')
    end
    @names = %W[快讯 鸟会动态 项目 鸟人学堂 鸟类观察]
  end
end
