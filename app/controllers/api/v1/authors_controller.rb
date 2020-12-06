class Api::V1::AuthorsController < ApplicationController

    def show
        author = Author.find_by(params[:id])

        render json: author
    end 

    def index 
        authors = Author.all 

        render json: authors
    end 

    def create 
        author = Author.new(author_params)
        if author.save 
             render json: author
        else render json: { error: "Uh Oh, looks like someone has that name already, Let's try to be original!"}, status: 401
        end
        
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
