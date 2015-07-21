
get "/users/:id/articles" do
  @users = User.find(params[:id])
  erb :"/users/articles"
end




#form to create new article
get "/users/:id/articles/new" do
  @users = User.find(params[:id])
  erb :"/articles/new"
end

#create user (form submission goes TO here)
post "/articles/:id/create" do
  title = params["title"]
  content = params["content"]
  user_id = params["id"]
  
  @article = Article.create({title: title, content: content, user_id: user_id})
  @users = User.find(params[:id])
  if @article.valid?
    # Make a GET request to the following path:
    redirect "/users/#{@users.id}/articles"
  else
    erb :"/users/:id/articles/new"
  end
end

get "/articles/:id" do
  @article = Article.find(params[:id])
  erb :"/articles/content"
end