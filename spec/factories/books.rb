fake_books = [
{ :title => "I Win!", :author => "U. Lose" },
{ :title => "Robots", :author => "Anne Droid" },
{ :title => "Danger!", :author => "Luke Out" },
{ :title => "Cloning", :author => "Irma Dubble II" },
{ :title => "Hot Dog!", :author => "Frank Furter" },
{ :title => "Cry Wolf", :author => "Al Armist" },
{ :title => "Wake Up!", :author => "Sal Ammoniac" },
{ :title => "I'm Fine", :author => "Howard Yu" },
{ :title => "Gambling", :author => "Monty Carlos" },
{ :title => "Mensa Man", :author => "Gene Yuss" },
{ :title => "Big Fart!", :author => "Hugh Jass" },
{ :title => "Hypnotism", :author => "N. Tranced" },
{ :title => "Downpour!", :author => "Wayne Dwops" },
{ :title => "Full Moon", :author => "Seymour Buns" },
{ :title => "Sea Birds", :author => "Al Batross" },
{ :title => "Teach Me!", :author => "I. Wanda Know" },
]
FactoryGirl.define do
  factory :book do
    transient do
      fake_book fake_books.sample
    end

    title { fake_book[:title] }
    author { fake_book[:author] }
    published_date do
       rand_days = rand(15340) # 42 years
       rand_days.days.ago.to_date
    end
  end
end
