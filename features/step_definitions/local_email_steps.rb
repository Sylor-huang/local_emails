Given("the sender {string},receiver {string}, subject {string}, body {string}") do |string, string2, string3, string4|
  puts(string)
end

When("sender is nil?") do
  puts("sender cannot be nil?")
end

Then("it should return sender can not be nil") do
  puts("sender can not be nil")
end

