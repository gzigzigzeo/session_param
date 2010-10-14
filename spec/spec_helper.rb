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
  session_param 'bar', proc { '1' }
  include Rails.application.routes.url_helpers
  
  def foo_a; render :text => foo; end
  def bar_a; render :text => bar; end  
end

SessionParam::Application.routes.draw do
  match '/tests/foo' => "tests#foo_a"
  match '/tests/bar' => "tests#bar_a"
end

require 'rspec/rails'