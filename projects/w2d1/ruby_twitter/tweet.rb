require 'faker'
# https://github.com/faker-ruby/faker

class Tweet
    MAX_CHARACTERS = 280

    def self.generate_random_tweet
        body = Faker::Lorem.sentence
        author = 'walker'
        Tweet.new(body, author)
    end

    def initialize(body, author)
        @body = body
        @author = author
        @likes = 0
        @created_at = Time.new
    end

    def self.max_characters
        MAX_CHARACTERS
    end

    def body
        @body
    end

    def body=(new_body)
        @body = new_body
    end

    def author
        @author
    end

    def likes
        @likes
    end

    def like
        @likes += 1
    end
end