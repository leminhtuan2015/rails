module ApplicationHelper
  def publ
	  data = {:from => "1", :to => "2", :sms =>"gagagaga"}
      $redis.publish :happy, data.to_json
  end
end
