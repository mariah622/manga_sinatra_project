class UsersController < ApplicationController

    get '/signup' do 
        erb :'users/signup'
    end
    
    post '/signup' do 
        # binding.pry
        u = User.new(params)

        # if u.email.blank? || u.password.blank? || User.find_by_emai l(params["email"])
        if !u.save
            redirect to '/signup'
        else
            
            u.save
            session[:user_id] = u.id
            redirect to '/mangas'
        end 





        # we must save this user. if user is not save, they should be redicreted. if they did not fill in the proper infr we must redirect back to teh sign in page. after a successful sign in, we then can redirect to '/animes' page. 
    end

    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do 
        # binding.pry
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