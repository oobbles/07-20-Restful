get "/" do
  erb :"/home"
end

#gets all
get "/users" do

end

#form to create new user
get "/users/new" do

end

#create user (form submission goes TO here)
post "/users" do
  redirect
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
