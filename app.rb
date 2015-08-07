$:.unshift File.join(File.dirname(__FILE__))
$:.unshift File.join(File.dirname(__FILE__), 'models')
require 'sinatra'
require 'models/status'
require 'json'

set :views, File.join(File.dirname(__FILE__), 'views') 

get "/" do
    status = Status.instance
    @someone_there = status.get
    erb :index   # , :locals => { someone_there => status.get }
end

get "/come" do
    status = Status.instance
    status.set true
    redirect "/"
end

get "/go" do
    status = Status.instance
    status.set false
    redirect "/"
end
