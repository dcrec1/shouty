Factory.define :shouty do |f|
  f.association :user
  f.body 'Hello World'
end
