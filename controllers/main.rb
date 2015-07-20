get "/" do
  erb :"/home"
end

#gets all
get "/users" do
@users = Users.all
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
  redirect "/users/#{@user.id}"
end

#redirecting from create
get "/users/:id" do
  @user = User.find(params[:id])
  erb :"users/show"
end
#show one user's edit form
get "/users/:id/edit" do

end

#Where user's edit form goes TO
put "users/:id" do
  redirect

end

#delete a user
delete "/users/:id" do

end

#show one user
get "/users/:id" do

end
