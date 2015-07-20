get "/" do
  erb :"/home"
end

#gets all
get "/users" do
  binding.pry
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
  @user=User.create({email: email, password: the_password})


  if @user.valid?
    # Make a GET request to the following path:
    redirect "/users/#{@user.id}"
  else
    erb :"users/new"
  end 
end


#show one user's edit form
get "/users/:id/edit" do
  # @user= User.find(id)
  erb :"users/edit"
end


#redirecting from create
get "/users/:id" do
  @user = User.find(params[:id])
  erb :"users/show"
end

#Where user's edit form goes TO
put "users/:id" do
  email = params["email"]
  password = params["password"]
  the_password = BCrypt::Password.create(password)
  @user=User.update({email: email, password: the_password})
  
  redirect "/users/#{@user.id}"
end

#delete a user
delete "/users/:id" do

end

#show one user
get "/users/:id" do

end
