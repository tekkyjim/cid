Given /^the following (.+) records?$/ do |factory, table|
  unless factory =! user
    table.hashes = table.hashes
  end
    table.hashes.each do |hash|
    Factory(factory, hash)
  end
end  