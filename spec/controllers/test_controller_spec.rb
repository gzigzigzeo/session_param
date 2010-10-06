require 'spec_helper'

describe TestsController do
  it 'should set session param when' do
    get 'index', :foo => '123456'
    response.body.should == '123456'
    session[:foo].should == '123456'
    
    get 'index'
    response.body.should == '123456'    
    session[:foo].should == '123456'
    
    get 'index', :foo => '123' 
    response.body.should == '123'   
    session[:foo].should == '123'
  end
end