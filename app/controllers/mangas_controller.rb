class MangasController < ApplicationController

    get '/mangas' do
        @mangas = Manga.all
        erb :'mangas/index'
    end 

    get '/mangas/new' do
        #form to create new movie
        erb :'mangas/new'
    end

    get '/mangas/:id' do
        @manga = Manga.find(params[:id])
        erb :'mangas/show'
    end 


    get '/mangas/:id/edit' do
        @manga = Manga.find(params[:id])
    end 

    post '/mangas' do 
        @manga = Manga.new(params)
        # binding.pry
        # @manga.save
    end 

    patch '/mangas/:id' do
        # edit a particular manga selection
        # @movie = Movie.find(params[:id])
    end 

    delete '/mangas/:id' do 
        #edit a particular manga selection
        # @movie = Movie.find(params[:id])
    end 

end 