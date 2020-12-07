class Api::V1::AuthController < ApplicationController

    def create 
        author = Author.find_by(username: params[:username])

        if author
            payload = { author_id: author.id}

            token = JWT.encode(payload, 'my_secret', 'HS256')


            render json: { author: {id: author.id, username: author.username}, notes: author.notes, token: token }
        else
            render json: { error: "Ooops! Looks like you need to sign up for an account! 
            It's so easy since I did not take the time to code a password process. Sign up today"}, status: 401
        end
    end

    def show
        token = request.headers[:Authorization].split(' ')[1] 
    
        decoded_token = JWT.decode(token, 'my_secret', true, { algorithm: 'HS256'})

        author_id = decoded_token[0]['author_id']

        author = Author.find(author_id)

        render json: { author: {id: author.id, username: author.username}, notes: author.notes }
    end
end