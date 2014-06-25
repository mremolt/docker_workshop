json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :published, :author
  json.url post_url(post, format: :json)
end
