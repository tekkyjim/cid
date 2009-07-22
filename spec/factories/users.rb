Factory.define :valid_user , :class => User do |u|
  u.login "bob"
  u.password "secret"
  u.password_confirmation "secret"
  u.email "bob@gmail.com"
  u.single_access_token "k3cFzLIQnZ4MHRmJvJzg"
end

Factory.define :invalid_user , :class => User do |u|
end