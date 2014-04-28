require 'open-uri'
class StaticPagesController < ApplicationController
  def home
  end

  def section_page
    @section = Section.find(params[:id])
    @request = request.original_url
  end
end
