Given("Row insertion: {string} {string} {string}") do |g_id, g_username, g_email|
  @id = g_id
  @username = g_username
  @email = g_email
  @commands = ["insert %s %s %s" % [@id, @username, @email],".exit"]
end

Then("REPL result {string}") do |answer|
  expect(@result).to match_array([
    "db> ",
    "db> %s" % answer,
  ])
end