class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:helper, :first_name, :last_name])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:longitude, :latitude])
    end


    def svg(name)
        file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
        return File.read(file_path).html_safe if File.exists?(file_path)
        '(not found)'
    end
end