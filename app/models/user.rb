class User < ActiveRecord::Base
	emailregex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :name, presence: true,
			 		 length: { maximum: 60 }
	validates :email, presence: true,
					  length: { maximum: 255 },
					  format: { with: emailregex },
                      uniqueness: { case_sensitive: false }
   
    validates :sid, presence: { message: "Student ID can't be blank" },
    				length: { minimum: 8, maximum: 8, message: "Student ID must be 8 digits" },
    				uniqueness: { message: "That student ID is already in use" }
end
