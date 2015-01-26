#SUBSCRIBE will listen to a channel

require 'rubygems'
require 'redis'
require 'json'

$redis = Redis.new(:timeout => 0)

$redis.subscribe('happy', 'ruby-lang') do |on|
  on.message do |channel, msg|
    data = JSON.parse(msg)
    puts "Channel:#{channel} From:[#{data['user']}] Text:#{data['text']}"
  end
end