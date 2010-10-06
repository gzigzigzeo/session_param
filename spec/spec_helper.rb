$LOAD_PATH << "." unless $LOAD_PATH.include?(".")

begin
  require "bundler"
  Bundler.setup
rescue Bundler::GemNotFound
  raise RuntimeError, "Bundler couldn't find some gems." +
    "Did you run `bundle install`?"
end

Bundler.require
require 'action_controller'

SessionParam.setup!

require 'rails/all'

module SessionParam
  class Application < ::Rails::Application
  end
end

class TestsController < ActionController::Base
  session_param 'foo', ''
  include Rails.application.routes.url_helpers
  
  def index; render :text => foo; end
end

SessionParam::Application.routes.draw do
  resources :tests
end

require 'rspec/rails'