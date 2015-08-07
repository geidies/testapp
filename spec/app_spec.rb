ENV['RACK_ENV'] = 'test'

require './models/status'
require 'rack/test'
require 'sinatra'
require './app'

describe "the web app" do

  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
  
  it "returns 200 on getting the index" do
    get '/'
    expect( last_response ).to be_ok
  end

  it "return 302 when requesting /come" do
    get '/come'
    expect(last_response.status).to be 302
  end

  it "has set absence when calling /come" do
    expect( Status.instance.get ).to be true
    get '/' # virtually follow it
    expect(last_response.body).to match /yes/i
  end

  it "return 302 when requesting /go" do
    get '/go'
    expect(last_response.status).to be 302
  end

  it "has set presence when calling /go" do
    expect( Status.instance.get ).to be false
    get '/' # virtually follow it
    expect(last_response.body).to match /nope/i
  end


end
