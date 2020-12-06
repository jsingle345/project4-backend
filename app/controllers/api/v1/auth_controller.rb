class Api::V1::AuthController < ApplicationController

    def create 
        author = Author.find_by(username: params[:username])

        if author
            render json: { author: {id: author.id, username: author.username}, notes: author.notes }
        else
            render json: { error: "Ooops! Looks like you need to sign up for an account! 
            It's so easy since I did not take the time to code a password process. Sign up today"}, status: 401
        end
    end
end