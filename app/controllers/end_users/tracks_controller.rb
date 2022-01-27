# flozen_string_literal: true
module EndUsers
  class TracksController < ApplicationController
    require 'itunes-search-api'
    require 'kaminari'

    def search
      @tracks = ITunesSearchAPI
      @searchs = @tracks.search(
        :term    => params[:term],
        :country => 'jp',
        :media   => 'music',
        :lang    => 'ja_jp',
        :limit  => '100000000000000000000'
        ).each do |item|
        p item
        print("#{item['artistName']},#{item['trackName']}\n")
      end
      @searchs = Kaminari.paginate_array(@searchs).page(params[:page]).per(15)

      device = request.env["HTTP_USER_AGENT"]
      if(device.include?('Mobile') || device.include?('Android'))
        render :mobile_search
      end
    end

    def show
      @list = Mylist.new
      @mylist = Mylist.find_by(end_user_id: current_end_user, artist_id: params[:artist_id], track_id: params[:track_id], collection_id: params[:collection_id])
      # @artist_page = open("https://music.apple.com/jp/artist/#{params[:artist_id]}").read
    end
    
    def create
      @list = Mylist.new
      @list.end_user_id = current_end_user.id
      @list.artist_id = params[:artist_id]
      @list.track_id = params[:track_id]
      @list.collection_id = params[:collection_id]
      @list.save
      @mylist = Mylist.find_by(end_user_id: current_end_user, artist_id: params[:artist_id], track_id: params[:track_id], collection_id: params[:collection_id])
    end
    
    def destroy
      @mylist = Mylist.find_by(end_user_id: current_end_user, artist_id: params[:artist_id], track_id: params[:track_id], collection_id: params[:collection_id])
      @list = Mylist.new
      @mylist.destroy
      @mylist = Mylist.find_by(end_user_id: current_end_user, artist_id: params[:artist_id], track_id: params[:track_id], collection_id: params[:collection_id])
    end
  end
end