class ApplicationController < ActionController::API
        def secret
        'dnkfnsdklfnsdjkflnsdjkf'
    end

    def encode_token(user)
        payload = {user_id: user.id}
        JWT.encode(payload, secret, 'HS256')
    end

    def token
        if request.headers['Authorization']
            request.headers['Authorization'].split(' ')[1]
        else
            nil 
        end
    end

    def decoded_token
        JWT.decode(token, secret, true, {algorithm: 'HS256'})
    end

    def active_user
        user_id = decoded_token[0]['user_id']
        User.find(user_id)
    end
end
