class UsersController < ApplicationController

    get '/signup' do 
        redirect_if_logged_in
        erb :'users/signup'
    end
    
    post '/signup' do 
        
        
        u = User.new(params)
    
        if !u.save
            redirect to '/signup'
        else
            
            u.save
            session[:user_id] = u.id
            redirect to '/mangas'
        end 
    end

    get '/login' do
        redirect_if_logged_in 
        erb :'users/login'
    end 

    post '/login' do 
    
        user = User.find_by_email(params[:email])
        
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/mangas'
        end
        redirect '/login'
    end

    post '/logout' do 
        session.clear
        redirect '/'
    end 
       
end 