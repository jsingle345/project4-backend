class Api::V1::AuthController < ApplicationController

    def create 
        author = Author.find_by(username: params[:username])

        if author
            render json: { author: {id: author.id, username: author.username}, notes: author.notes }
        else
            render json: { error: "Sorry that Username is taken. Let's try to be original please"}, status: 401
        end
    end
end