require_relative './user.rb'

class Twitter
    def initialize
        @users = []
    end

    def users
        @users
    end

    def signup(user)
        @users << user
    end 
end

