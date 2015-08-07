require 'mock_redis'
require 'singleton'

class Status
  include Singleton # Calling Status.new will give an error now. Use Status.instance instead.

  def initialize
    @redis = MockRedis.new( :url => ENV["REDISTOGO_URL"] ) # later, that env variable will be filled.
  end

  def get
    status = @redis.get "status"
    if status == nil
      false
    elsif status == "true"
      true
    else
      false
    end
  end

  def set status
    if status == true
      @redis.set "status", "true"
      true
    elsif status == false
      @redis.set "status", "false"
    else
      false
    end
  end

end
