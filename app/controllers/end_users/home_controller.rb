module EndUsers
  class HomeController < ApplicationController
    def top
      @end_user = EndUser.new
    end
    
    def about
    end
  end
end
