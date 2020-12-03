class SessionsController < ApplicationController

    def new
    end 

    def create
        author = Author.find_or_create_by(:username => params[:username])
        session[:author_id] = author.id
    end

    def destroy
        reset_session

        
    end
end
