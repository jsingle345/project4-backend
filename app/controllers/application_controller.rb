class ApplicationController < ActionController::API

    def issue_token(author)
        JWT.encode({author_id: author.id}, ENV['secret_key'], 'HS256')
    end

    def current_author
        @author ||= Author.find_by(id: author_id)
    end

    def token 
        request.headers['Authorization']
    end

    def decoded_token
        begin
            JWT.decode(token, ENV['secret_key'], true, { :algorithm => 'HS256' })
        rescue JWT::DecodeError
            [{}]
        end 
    end

    def author_id
        decoded_token.first['author_id']
    end  

    def logged_in?
        !!current_author
    end
end
