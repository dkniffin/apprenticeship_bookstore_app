# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.create :email => 'someuser@example.com', :password => 'password123!'

def rand_date
  rand(15340).days.ago(Date.today)
end
Book.create([
{ :title => "I Win!", :author => "U. Lose", :published_date => rand_date},
{ :title => "Robots", :author => "Anne Droid", :published_date => rand_date},
{ :title => "Danger!", :author => "Luke Out", :published_date => rand_date},
{ :title => "Cloning", :author => "Irma Dubble II", :published_date => rand_date},
{ :title => "Hot Dog!", :author => "Frank Furter", :published_date => rand_date},
{ :title => "Cry Wolf", :author => "Al Armist", :published_date => rand_date},
{ :title => "Wake Up!", :author => "Sal Ammoniac", :published_date => rand_date},
{ :title => "I'm Fine", :author => "Howard Yu", :published_date => rand_date},
{ :title => "Gambling", :author => "Monty Carlos", :published_date => rand_date},
{ :title => "Mensa Man", :author => "Gene Yuss", :published_date => rand_date},
{ :title => "Big Fart!", :author => "Hugh Jass", :published_date => rand_date},
{ :title => "Hypnotism", :author => "N. Tranced", :published_date => rand_date},
{ :title => "Downpour!", :author => "Wayne Dwops", :published_date => rand_date},
{ :title => "Full Moon", :author => "Seymour Buns", :published_date => rand_date},
{ :title => "Sea Birds", :author => "Al Batross", :published_date => rand_date},
{ :title => "Teach Me!", :author => "I. Wanda Know", :published_date => rand_date},
])
