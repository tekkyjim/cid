Factory.define :user , :class => User do |f|
  f.sequence(:login) { |n| "foo#{n}" }
  f.password "foobar"
  f.password_confirmation  { |u| u.password }
  f.sequence(:email) { |n| "foo#{n}@example.com" }
  f.single_access_token Authlogic::Random.friendly_token
  f.role 1
  f.city  { |u| u.association(:city) }
end

Factory.define :invalid_user , :class => User do |u|
end