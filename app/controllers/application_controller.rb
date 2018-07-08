class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Tipo de flash para o bootstrap 4.1
  add_flash_types :primary,
                  :secondary,
                  :success,
                  :danger,
                  :warning,
                  :info,
                  :light,
                  :dark
end
