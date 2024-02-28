class PasswordsController < ApplicationController

    before_action :require_user_logged_in!

    def edit
    end

    def update
        if Current.user.update(password_params)
            redirect_to root_url, notice: "Password updated!"
        else
            render :edit, status: :unprocessable_entity #status added for Rails 7
        end

    end

    private 

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end