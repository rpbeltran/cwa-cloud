class LoginsController < ApplicationController
  #example function I''m using while trying to get rspec to work
  def sum arr    
    return arr.sum
  end
    
  def receive
      if id_token = flash[:google_sign_in_token]
        identity = GoogleSignIn::Identity.new(id_token)
        user = User.find_by user_id: identity.user_id
        if user # Existing login
          cookies.signed[:user_id] = user.user_id
          redirect_to "/"
        else # New user
          User.create(:user_id => identity.user_id) do |u|
            u.name = identity.name
            u.email_address = identity.email_address
            u.avatar_url = identity.avatar_url
            u.locale = identity.locale
          end
          redirect_to "/"
        end
      elsif error = flash[:google_sign_in][:error] # Login error
        logger.error "Google authentication error: #{error}"
        redirect_to "/", alert: 'authentication_failed'
      end
  end

  def create
    # Login existing user here
    if user = authenticate_with_google
      cookies.signed[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/", alert: 'authentication_failed'
    end
  end
  
  def logout
    cookies.delete(:user_id)
    redirect_to "/"
  end

  private
    def authenticate_with_google
      if id_token = flash[:google_sign_in][:id_token]
        User.find_by user_id: GoogleSignIn::Identity.new(id_token).user_id
      elsif error = flash[:google_sign_in][:error]
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
end