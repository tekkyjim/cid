Given /^the following (.+) records?$/ do |factory, table|
    table.hashes.each do |hash|
      if factory == "user"
        Factory(factory, hash.merge("single_access_token"  => Authlogic::Random.friendly_token))
      else
        Factory(factory, hash)
      end
    end
end