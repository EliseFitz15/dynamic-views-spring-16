require "sinatra"
require "pry"
require_relative "lib/task"


#Static View
get "/" do
  "<h1>Hello, World!</h1>"
end

#Dynamic View
get "/time" do
  "<h1>Hello, World!</h1>" +
  "<p>The time is currently #{Time.now}!"
end

#Dynamic Routing

get "/hello/:name" do |name|
  "<h1>Hello, #{name}</h1>"
end

#Dynamic Views with ERB
TODOS = [
  Task.new("Learn Sinatra", true),
  Task.new("Build Dynamic Web Pages"),
  Task.new("Become Great")
]

get "/todos" do
  @to_dos_list = TODOS
  erb :index
end

get "/todos/:task_name" do
  @task = TODOS.select {|task| task.name == params[:task_name]}.first

  erb :show
end
