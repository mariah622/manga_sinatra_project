class MangasController < ApplicationController

    get '/mangas' do
        @mangas = Manga.all
        erb :'mangas/index'
    end 

    get '/mangas/:id' do
        @manga = Manga.find(params[:id])
        erb :'mangas/show'
    end 

    # get '/mangas/new' do
    #     #form to create new movie
    #     erb :'mangas/new'
    # end

    # get '/mangas/:id/edit'
    #     erb :'mangas/edit'

    # post '/mangas' do 
    # # create new mangas
    # end 

    # patch '/mangas/:id' do
    #     # edit a particular manga selectin
    # end 

    # delete '/mangas/:id' do 
    #     #edit a particular manga selection
    # end 

end 