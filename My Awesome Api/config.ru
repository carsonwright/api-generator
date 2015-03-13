require_relative 'config/environment'
require 'rack/cors'


use Rack::Cors do
    allow do
      origins '*'
      resource '/*', :headers => :any, :methods => [:get, :post, :options, :put, :delete]
    end
end

run Api
