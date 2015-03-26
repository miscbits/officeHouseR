class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery
  include SessionsHelper
end
