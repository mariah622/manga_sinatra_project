class MangasController < ApplicationController

    get '/mangas' do
        redirect_if_not_logged_in
        @mangas = Manga.all
        erb :'mangas/index'
    end 

    get '/mangas/new' do
        redirect_if_not_logged_in 
        @genres = Genre.all
        #form to create new movie
        erb :'mangas/new'
    end

    get '/mangas/:id' do
        redirect_if_not_logged_in 
        @manga = Manga.find(params[:id])
        erb :'mangas/show'
    end 


    get '/mangas/:id/edit' do
        redirect_if_not_logged_in
        
        @manga = Manga.find(params[:id])
        
        redirect_if_not_authorized 

        erb :'mangas/edit'
    end 

    post '/mangas' do
        redirect_if_not_logged_in
        @manga = Manga.new(params['manga'])
        @manga.user_id = session[:user_id]
        @genre = params[:genre][:name].capitalize
        if genre = Genre.find_by_name(@genre)
            @manga.genre = genre
        else
            @manga.genre = Genre.create(name: @genre)
        end

        @creator = params[:creator][:name].capitalize
        if creator = Creator.find_by_name(@creator)
            @manga.creator = creator
        else
            @manga.creator = Creator.create(name: @creator)
        end
        # binding.pry
        @manga.save
        redirect '/mangas'
    end

    patch "/mangas/:id" do 
        redirect_if_not_logged_in 
        @manga = Manga.find(params[:id])

        redirect_if_not_authorized

        @manga.update(params["manga"])
        
        redirect :'mangas/#{@manga.id}'
    end 

    delete '/mangas/:id' do 
        redirect_if_not_logged_in 
        #delete a particular manga selection
        @manga = Manga.find(params[:id])

        redirect_if_not_authorized

        @manga.destroy
        redirect :'/mangas'
    end 

    private
    def redirect_if_not_authorized
        if @manga.user != current_user
            redirect '/mangas'
        end 
    end 

end 