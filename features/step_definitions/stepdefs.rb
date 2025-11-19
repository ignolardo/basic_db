module Commands
  def run_script(commands)
    raw_output = nil

    IO.popen("./bin/my_db.exe", "r+") do |pipe|
      commands.each do |command|
        pipe.puts command
      end
      
      pipe.close_write
      
      # Read entire output
      raw_output = pipe.gets nil
    end
    
    raw_output.to_s.split("\n")
  end
end

World Commands

Given 'Script command: {string}' do |g_command|
  @commands = [g_command]
end

When /I run script/ do
  @result = run_script(@commands.append(".exit"))
end

Then "REPL result {string}" do |answer|
  expect(@result).to match_array([
    "db> %s" % answer,
    "db> ",
  ])
end


