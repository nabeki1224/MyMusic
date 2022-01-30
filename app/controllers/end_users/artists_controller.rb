class EndUsers::ArtistsController < ApplicationController
  require 'mechanize'
  before_action :applemusic
  def show
    # @artistnumber = params[:artist_id]
    # @artistname = URI.open("https://music.apple.com/jp/artist/#{params[:artist_id]}").read
    @mysinger = Mysinger.new
    @mysingers = current_end_user.mysingers
  end
  
  def follower
    end_users = EndUser.all
    @follower = []
    end_users.each do |enduser|
      enduser.mysingers.each do |mysinger|
        if mysinger.artist_id == params[:artist_id].to_i
          @follower.push(mysinger.end_user)
          break
        end
      end
    end
  end
  
  def applemusic
    agent = Mechanize.new
    page = agent.get("https://music.apple.com/jp/artist/#{params[:artist_id]}")
    @artistname = page.search('h1')
    @aboutartist = page.search('div.titled-box-content')
  end

end
