# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = [ { name: "jQuery", site: "http://jquery.com/", description: "Write less, do more." }, { name: "Sammy", site: "http://sammyjs.org/", description: "Small with class." }, { name: "Backbone", site: "http://documentcloud.github.com/backbone/", description: "Models for your apps." }, { name: "AngularJS", site: "http://angularjs.org", description: "HTML enhanced for web apps!" }, { name: "Spine", site: "http://spinejs.com/", description: "Awesome MVC Apps." }, { name: "SproutCore", site: "http://sproutcore.com/", description: "Innovative web-apps." }, { name: "Cappucino", site: "http://cappuccino.org/", description: "Objective-J." }, { name: "Knockout", site: "http://knockoutjs.com/", description: "MVVM pattern." }, { name: "GWT", site: "https://developers.google.com/web-toolkit/", description: "JS in Java." }, { name: "Batman", site: "http://batmanjs.org/", description: "Quick and beautiful." }, { name: "Ember", site: "http://emberjs.com/", description: "Ambitious web apps." } ]

Project.delete_all

projects.each do |project|
  Project.create(project)
end
