get "/" do
  erb :"/home"
end

#gets all
get "/users" do
  @users = User.all
  erb :"/users/all"
end

#form to create new user
get "/users/new" do
  erb :"/users/new"
end

#create user (form submission goes TO here)
post "/users/create" do
  email = params["email"]
  password = params["password"]
  the_password = BCrypt::Password.create(password)
  @users=User.create({email: email, password: the_password})


  if @users.valid?
    # Make a GET request to the following path:
    redirect "/users/#{@users.id}"
  else
    erb :"users/new"
  end
end


#show one user's edit form
get "/users/:id/edit" do
  @users = User.find(params[:id])
    erb :"users/edit"
end


#redirecting from create
get "/users/:id" do
  @users = User.find(params[:id])
  erb :"users/show"
end

#Where user's edit form goes TO
put "/users/:id" do
  @users = User.find(params[:id])
  @users.email = params[:email]
  @users.save

  redirect "/users/#{@users.id}"
end

#delete a user
delete "/users" do
  @users = User.find(params[:user_id])
  @users.destroy
  redirect "/users"
end


#show one user
get "/users/:id" do
  @users = User.find(params[:id])
  erb :"users/show"
end

