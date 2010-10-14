require 'spec_helper'

describe TestsController do
  it 'should set session param when' do
    get 'foo_a', :foo => '123456'
    response.body.should == '123456'
    session[:foo].should == '123456'
    
    get 'foo_a'
    response.body.should == '123456'    
    session[:foo].should == '123456'
    
    get 'foo_a', :foo => '123' 
    response.body.should == '123'   
    session[:foo].should == '123'
  end
  
  it 'should set session param if default is a block' do
    get 'bar_a'
    response.body.should == '1'
    session[:bar].should == '1'
    
    get 'bar_a', :bar => '12345'
    response.body.should == '12345'
    session[:bar].should == '12345'    
  end
end