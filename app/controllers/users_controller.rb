class UsersController < ApplicationController

    get '/signup' do 
        erb :'users/signup'
    end
    
    post '/signup' do 
        # we must save this user. if user is not save, they should be redicreted. if they did not fill in the proper infr we must redirect back to teh sign in page. after a successful sign in, we then can redirect to '/animes' page. 
    end

    get '/login' do 
        erb :'users/login'
    end 

    # post '/login' do 
        # redirect to '/animes'. it should only redirect if you are loggin in. 
    # end 

    # post '/logout do'
    # end 




    
end 