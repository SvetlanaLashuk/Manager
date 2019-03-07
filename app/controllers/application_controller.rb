class ApplicationController < ActionController::Base
  # Токен безопасности для защиты от подделанных запросов
  protect_from_forgery with: :exception
  add_flash_types :success, :danger, :info, :warning
end
