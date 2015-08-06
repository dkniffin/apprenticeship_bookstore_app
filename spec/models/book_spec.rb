require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { Book.new }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:published_date) }
  it { is_expected.to respond_to(:author) }
  it { is_expected.to respond_to(:category) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:price) }

  describe "valid book" do
    subject(:book) { build(:book) }

    it "is valid" do
      expect(book).to be_valid
    end
    it "has a title" do
      expect(book.title).to be_a(String)
    end
    it "has an author" do
      expect(book.author).to be_a(String)
    end
    it "has a published_date" do
      expect(book.published_date).to be_a(Date)
    end
    it "has a price" do
      expect(book.price).to be_a(Money)
    end
  end
  describe "invalid book" do
    let(:no_title) { build(:book, title: nil) }
    let(:no_published_date) { build(:book, published_date: nil) }
    let(:no_author) { build(:book, author: nil) }
    let(:no_price) { build(:book, price_cents: nil) }

    it "is invalid without title" do
      expect(no_title).to_not be_valid
      expect(no_title.errors).to include(:title)
      expect(no_title.errors[:title]).to include("can't be blank")
    end
    it "is invalid without published_date" do
      expect(no_published_date).to_not be_valid
      expect(no_published_date.errors).to include(:published_date)
      expect(no_published_date.errors[:published_date]).to include("can't be blank")
    end
    it "is invalid without author" do
      expect(no_author).to_not be_valid
      expect(no_author.errors).to include(:author)
      expect(no_author.errors[:author]).to include("can't be blank")
    end
    it "is invalid without price" do
      expect(no_price).to_not be_valid
      expect(no_price.errors).to include(:price)
      expect(no_price.errors[:price]).to include("can't be blank")
    end
  end
end
