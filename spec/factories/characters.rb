Factory.define :valid_character, :class => Character do |t|
  t.name "First Character"
  t.bio "First Character Bio"
  t.user { |u| u.association(:user) }
end

Factory.define :invalid_character, :class => Character do |t|
end