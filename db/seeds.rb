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
{ :title => "Falling Trees", :author => "Tim Burr", :published_date => rand_date },
{ :title => "Monkey Shines", :author => "Bob Boone", :published_date => rand_date },
{ :title => "Why Cars Stop", :author => "M.T. Tank", :published_date => rand_date },
{ :title => "Turtle Racing", :author => "Eubie Quick", :published_date => rand_date },
{ :title => "Military Rule", :author => "Marshall Law", :published_date => rand_date },
{ :title => "I Like Liquor", :author => "Ethyl Alcohol", :published_date => rand_date },
{ :title => "I Love Crowds", :author => "Morris Merrier", :published_date => rand_date },
{ :title => "The Yellow River,", :author => "I. P. Freely", :published_date => rand_date },
{ :title => "Off To Market", :author => "Tobias A. Pigg", :published_date => rand_date },
{ :title => "A Great Plenty", :author => "E. Nuff", :published_date => rand_date },
{ :title => "Mosquito Bites", :author => "Ivan Itch", :published_date => rand_date },
{ :title => "My Lost Causes", :author => "Noah Veil", :published_date => rand_date },
{ :title => "Grave Mistakes", :author => "Paul Bearer", :published_date => rand_date },
{ :title => "Get Out There!", :author => "Sally Forth", :published_date => rand_date },
{ :title => "Red Vegetables", :author => "B. Troot", :published_date => rand_date },
{ :title => "Irish Flooring", :author => "Lynn O'Leum", :published_date => rand_date },
{ :title => "Highway Travel", :author => "Dusty Rhodes", :published_date => rand_date },
{ :title => "It's a Shocker", :author => "Alec Tricity", :published_date => rand_date },
{ :title => "Keep it Clean!", :author => "Armand Hammer", :published_date => rand_date },
{ :title => "I Hit the Wall", :author => "Isadore There", :published_date => rand_date },
{ :title => "Ship Mysteries", :author => "Marie Celeste", :published_date => rand_date },
{ :title => "I Hate the Sun", :author => "Gladys Knight", :published_date => rand_date },
{ :title => "It's a Holdup!", :author => "Nick R. Elastic", :published_date => rand_date },
{ :title => "He Disappeared!", :author => "Otto Sight", :published_date => rand_date },
{ :title => "I Hate Fighting", :author => "Boris Hell", :published_date => rand_date },
{ :title => "Mexican Revenge", :author => "Monty Zuma", :published_date => rand_date },
{ :title => "I Didn't Do It!", :author => "Ivan Alibi", :published_date => rand_date },
{ :title => "Life in Chicago", :author => "Wendy City", :published_date => rand_date },
{ :title => "Without Warning", :author => "Oliver Sudden", :published_date => rand_date },
{ :title => "Pain in My Body", :author => "Otis Leghurts", :published_date => rand_date },
{ :title => "Desert Crossing", :author => "I. Rhoda Camel", :published_date => rand_date },
{ :title => "Candle-Vaulting", :author => "Jack B. Nimble", :published_date => rand_date },
{ :title => "Happy New Year!", :author => "Mary Christmas", :published_date => rand_date },
{ :title => "You're Kidding!", :author => "Shirley U. Jest", :published_date => rand_date },
{ :title => "Webster's Words", :author => "Dick Shunnary", :published_date => rand_date },
{ :title => "Those Funny Dogs", :author => "Joe Kur", :published_date => rand_date },
{ :title => "Wind Instruments", :author => "Tom Bone", :published_date => rand_date },
{ :title => "Winning the Race", :author => "Vic Tree", :published_date => rand_date },
{ :title => "Crocodile Dundee", :author => "Ali Gator", :published_date => rand_date },
{ :title => "Covered Walkways", :author => "R. Kade", :published_date => rand_date },
{ :title => "I Need Insurance", :author => "Justin Case", :published_date => rand_date },
{ :title => "Whatchamacallit!", :author => "Thingum Bob", :published_date => rand_date },
{ :title => "Let's Do it Now!", :author => "Igor Beaver", :published_date => rand_date },
{ :title => "I'm Someone Else", :author => "Ima Nonymous", :published_date => rand_date },
{ :title => "Animal Illnesses", :author => "Ann Thrax", :published_date => rand_date },
{ :title => "He's Contagious!", :author => "Lucas Measles", :published_date => rand_date },
{ :title => "The Great Escape", :author => "Freida Convict", :published_date => rand_date },
{ :title => "Music of the Sea", :author => "Lawrence Whelk", :published_date => rand_date },
{ :title => "Breaking the Law", :author => "Kermit A. Krime", :published_date => rand_date }
])
