class ApplicationController < ActionController::API
  before_action :mod_headers
  def mod_headers
      response.headers['Access-Control-Allow-Origin'] = '*'
  end
end
