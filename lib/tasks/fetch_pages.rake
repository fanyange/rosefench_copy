require 'open-uri'

namespace :task do
  desc "create pages sections and store them in database"
  task :create_sections => :environment do
    section_names = %W[快讯 鸟会动态 项目 鸟人学堂 鸟类观察]
    [2,1,3,5,6].each_with_index do |origin_id, index|
      name = section_names[index]
      Section.create(name: name, origin_id: origin_id) unless Section.find_by(name: name)
    end
  end

  desc "fetch pages from origin site: htt//rosefench.net"
  task :fetch_pages => :create_sections do
    sections = Section.all
    sections.each do |section|
      base_url = "http://rosefench.net"
      doc = Nokogiri::HTML(open("#{base_url}/news.php?lb=#{section.origin_id}"))
      posts = doc.css('.line a')
      posts.each do |p|
        p_tile = p.text
        p_url = p[:href]
        # p_doc = Nokogiri::HTML(open("#{base_url}/#{p_url}"))
        # p_content = p_doc.css()
        post = section.posts.build(title: p_tile, content: base_url + "/" + p_url)
        puts "get something wrong with the post:\n#{p_tile}\n#{p_url}" unless post.save
      end
    end
  end
end