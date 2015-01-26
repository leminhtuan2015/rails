#PUBLISH allows you to push a message into a channel
# usage:
# ruby pub.rb channel_name username

require 'rubygems'
require 'redis'
require 'json'

$redis = Redis.new

data = {"user" => ARGV[1]}

loop do
  msg = STDIN.gets
  if msg =="exit\n"
  	return 0
  end
  p "Sent:"+msg
  $redis.publish ARGV[0], data.merge('msg' => msg.strip).to_json
end