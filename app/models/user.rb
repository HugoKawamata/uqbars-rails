class User < ActiveRecord::Base
	emailregex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :name, presence: true,
			 		 length: { maximum: 60 }
	validates :email, presence: true,
					  length: { maximum: 255 },
					  format: { with: emailregex },
                      uniqueness: { case_sensitive: false }
   
    validates :sid, presence: true,
    				length: { minimum: 8, maximum: 8 },
    				uniqueness: true
end
