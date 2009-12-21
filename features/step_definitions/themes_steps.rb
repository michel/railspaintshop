Given /^there are no themes on the site$/ do
 Theme.destroy_all
 Theme.all should be(nil)
end

Given /^that the following themes exist:$/ do |themes|
  themes.hashes.each do |theme|
    Theme.create(theme)
  end
end
       