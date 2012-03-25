class HelloController < ApplicationController
  def index
    expires_in 10.seconds, :public => true
    render :text => "Hello world"
  end
end
