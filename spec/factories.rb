Factory.sequence :theme_name do |n|
 "Nice theme #{n}"
end

Factory.define :theme do |t|     
  t.name { Factory.next :theme_name }
  t.repo  'git://nicerepo.git'
  t.description "this is niiceee"
end