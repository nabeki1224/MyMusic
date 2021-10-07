class EndUsers::HomeController < ApplicationController

    def top
    	render :layout => nil
    	@end_user = EndUser.new
    end
    
    def about
    end
end
