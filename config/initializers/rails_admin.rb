RailsAdmin.config do |config|
  config.authorize_with do
    if user_signed_in?
      redirect_to main_app.root_path unless current_user.id == 1
    else
      redirect_to main_app.root_path
    end
  end
end
