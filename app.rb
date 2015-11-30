require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'crud'
  )

get '/'  do
 @users =User.all

 erb :index
end

get '/users/new' do
 erb :new
end

post '/users/create' do
 user = User.new(params[:user])
 if user.save
  redirect '/'
else
  erb :new
end
end
