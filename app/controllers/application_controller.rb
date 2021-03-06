class ApplicationController < ActionController::Base
    before_action :set_up_auth_variables

    def set_up_auth_variables
        @user_id = session["user_id"]
        @logged_in = !!@user_id
        if @logged_in
            @current_user = User.find(@user_id)
        end
    end
  
    def authorized
      unless @logged_in
        return redirect_to users_path
      end
    end
  
    def logout
      session["user_id"] = nil
    end

end