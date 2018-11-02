require 'pry'
# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class

class User
    attr_reader :name
    # many photos 
    # many comments
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def comments
        Comment.all.select{|comment| comment.user == self}
    end

    def photos
        comments.map{|comment| comment.photo}
    end
end

class Photo 
    attr_accessor :user

    @@all = []

    def initialize 
        @@all << self
    end

    def self.all
        @@all
    end

    def comments
        Comment.all.select{|comment| comment.photo == self}
    end

    def users
        comments.map{|comment| comment.user}
    end

    def make_comment(message, user)
        Comment.new(message, user, self)
    end
end

class Comment 
    attr_accessor :message, :user, :photo

    @@all = []

    def initialize(message, user, photo)
        @user = user
        @photo = photo 
        @message = message
        @@all << self
    end

    def self.all
        @@all
    end

end

sandwich_photo = Photo.new  # X
sophie = User.new("Sophie") # X
sandwich_photo.user = sophie # X
sandwich_photo.user.name # X
# => "Sophie"
sophie.photos # X
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []
u2 = User.new("Troll")

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch", u2)
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]

binding.pry
'1'