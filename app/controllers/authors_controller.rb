class AuthorsController < ApplicationController

    def show
        author = Author.find_by(params[:id])

        render json: author, include: :notes, except: [:created_at, :updated_at]
    end 

    def index 
        authors = Author.all 

        render json: authors, include: :notes, except: [:created_at, :updated_at]
    end 

    def create 
        author = Author.create(author_params)
        
        render json: author
    end

    def update 
        author = Author.find(params[:id])

        author.update(author_params)
        
        render json: author
    end

    def destroy
        author = Author.find(params[:id])

        author.destroy 
    end

    private 
     
    def author_params
        params.require(:author).permit(:username, :note)
    end

end
