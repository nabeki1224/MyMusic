class EndUsers::ArtistsController < ApplicationController
  require 'mechanize'
  def show
    # @artistnumber = params[:artist_id]
    # @artistname = URI.open("https://music.apple.com/jp/artist/#{params[:artist_id]}").read
    agent = Mechanize.new
    page = agent.get("https://music.apple.com/jp/artist/#{params[:artist_id]}")
    @artistname = page.search('h1')
    @aboutartist = page.search('div.titled-box-content')
    @mysinger = Mysinger.new
    @mysingers = current_end_user.mysingers
  end
end
