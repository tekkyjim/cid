Factory("page", :name => "home", :title => "Welcome to Cities in Darkness")
Before do
  
  Factory("city", :name => "Middlesborough")
  Factory("user", :login => "admin", :email => "admin@test.com", :password => "secret", :role => 3, :single_access_token  => Authlogic::Random.friendly_token)
  Factory("user", :login => "bob",  :email => "bob@test.com",:password => "secret", :role => 1, :single_access_token  => Authlogic::Random.friendly_token)
  Factory("user", :login => "harry",  :email => "harry@test.com",:password => "secret", :role => 1, :single_access_token  => Authlogic::Random.friendly_token)
end
at_exit do
  User.delete_all
  City.delete_all

end