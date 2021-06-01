require_relative './tweet.rb' # requiring code from another file

class User
    def initialize(username)
        @username = username
        @tweets = []
        @following = []
    end

    def username
        @username
    end

    def username=(new_username)
        @username = new_username
    end

    def tweets
        @tweets
    end

    def following
        @following
    end

    def follow(other_user)
        # following is not a local variable
        following << other_user
    end

    def tweet(body)
        if body.length > Tweet.max_characters
            puts 'That body is too long. Please keep it under 290 characters'
        end
        # if body.length > Tweet::MAX_CHARACTERS
        #     puts 'That body is too long. Please keep it under 290 characters'
        # end

        tweets << Tweet.new(body, self)
    end
end