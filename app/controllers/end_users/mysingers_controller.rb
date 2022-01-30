class EndUsers::MysingersController < ApplicationController
  require 'mechanize'
  def index
    @end_user = EndUser.find(params[:end_user_id])
    @mysingers = @end_user.mysingers
    @agent = Mechanize.new
  end

  def create
    mysinger = Mysinger.new(mysinger_params)
    mysinger.end_user_id = params[:end_user_id]
    mysinger.save
    redirect_to request.referer
  end
  
  def destroy
    mysinger = Mysinger.find_by(artist_id: params[:id])
    mysinger.destroy
    redirect_to request.referer
  end
  
  private
  def mysinger_params
    params.require(:mysinger).permit(:artist_id, :name)
  end
end
