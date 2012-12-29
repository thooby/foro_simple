FactoryGirl.define :category do |f|
  f.sequence(:title)  { |n| "Tiulo{n|" }
  f.state = true
  f.sequence(:position)  { |n| n } 
end
