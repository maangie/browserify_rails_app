json.array!(@todos) do |todo|
  json.extract! todo, :id, :title, :content, :todo_date
  json.url todo_url(todo, format: :json)
end
