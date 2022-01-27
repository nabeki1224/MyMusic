# flozen_string_literal: true
module EndUsers
  class MylistsController < ApplicationController
    before_action :authenticate_end_user!
    def destroy
      @list = Mylist.find_by(end_user_id: current_end_user, artist_id: params[:artist_id], track_id: params[:track_id], collection_id: params[:collection_id])
      @list.destroy
      if params[:id] != nil
        @end_user = EndUser.find(params[:id])
        @mylists = @end_user.mylists
      end
    end

    def show
      @mylist = Mylist.where(end_user_id: params[:id])
      @end_user = EndUser.find(params[:id])
      @mylists = @end_user.mylists
    end
  end
end
