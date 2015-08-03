json.array!(@books) do |book|
  json.extract! book, :id, :title, :published_date, :author
  json.url book_url(book, format: :json)
end
