get '/users' do
  @users = User.all
  erb :'users/index'
end


#User registration form
get '/users/new' do
  erb :'users/new'
end

#Create new user route
post '/users' do
  @user = User.create(first_name: params[:first_name], last_name: params[:last_name], user_name: params[:user_name], email: params[:email], password: params[:password])
  if @user.valid?
    session[:user_id] = @user.id
    session[:name] = @user.full_name
    redirect '/questions'
  else
    redirect "/users/new?errors=#{@user.errors.full_messages.join(" and ")}"
  end
end


#View a specific user
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end


#Form to edit user profile
get '/users/:id/edit' do
  erb :'/users/edit'
end

#Edit user profile submit route
put '/users/:id' do

end

#Delete user route
delete '/users/:id' do

end

#User login route
post '/users/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    session[:name] = user.full_name
    redirect '/users'
  else
    erb :index
  end
end

#User logout route
post '/users/logout' do
  session[:user_id] = nil
  session[:name] = nil
  redirect '/'
end
