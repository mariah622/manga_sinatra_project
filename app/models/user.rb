class User < ActiveRecord::Base
    has_many :mangas
    validates :email, :password, presence: true
    has_secure_password #this turns whatever the password input is to a random set of letters. It adds some salt to it. It runs it thoruogh a hashing mechcanism. In this case, bcrypt. Bcrypt is a hashing algorithm 
    # has_secure_password provides a reader and writer method for our password. tux
    
end 