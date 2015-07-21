


def current_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
  else
    redirect "/"
  end
end

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
  binding.pry
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

  if session[:user_id] == @users.id
    erb :"users/show"
  else
    redirect "/"
  end
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

post "/verify_login" do
  attempted_password = params["password"]
  @users = User.where("email" => params["email"])
  # puts @user[0].password
  # Assuming there is a user with the given email address...
  # Make a new BCrypt object with the **password from the database**.
  actual_password = BCrypt::Password.new(@users[0].password)
  # puts "?????????????????????????????????????????????????????????\n\n\n"
  session[:user_id] = @users[0].id
  # So, an example:
  # actual_password = BCrypt::Password.new("$2a$10$87jFZs7pY2Fh33HR.lA9ouVLzevh45esv0UjdYF/b1jOGKC.YtfG2")

  if actual_password == attempted_password
    redirect "/users/#{@users[0].id}"
  else
    "Invalid login."


  end
end
