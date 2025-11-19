Given "Row insertion: {string} {string} {string}" do |g_id, g_username, g_email|
  @commands = ["insert #{g_id} #{g_username} #{g_email}"]
end


Given /An insertion command with maximum argument length/ do
  @commands = ["insert 1 #{"a"*32} #{"a"*255}"]
end

Given /An insertion command with exceeded maximum argument length/ do
  @commands = ["insert 1 #{"b"*33} #{"b"*256}"]
end

