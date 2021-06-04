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

        erb :'mangas/edit'
    end 

    post '/mangas' do 
        @manga = Manga.new(params)
        @mangas = Manga.all
        @manga.save
        redirect '/mangas'
    end 

    patch "/mangas/:id" do 
        @manga = Manga.find(params[:id])
        @manga.update(params["manga"])
        
        redirect :'mangas/#{@manga.id}'
    end 

    delete '/mangas/:id' do 
        #delete a particular manga selection
        @manga = Manga.find(params[:id])
        @manga.destroy
        redirect :'/mangas'
    end 

end 