class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include Pundit::Authorization

  delegate :t, to: I18n
end
