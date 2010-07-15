Factory.define :user do |u|
  u.email "yanekk@poczta.fm"
  u.password "this_is_password"
  u.password_confirmation {|user| user.password }
end

