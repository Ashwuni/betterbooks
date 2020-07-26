class User < ApplicationRecord   
    validates_presence_of :name
    validates_length_of :name, maximum: 70    
    validates_presence_of :email
    validates_length_of :email, maximum: 255
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email, uniqueness: true

#     double check
#     ensures no duplicate emails
#     and make sure the User model does a 
#     uniqueness validation so that web users 
#     are given the correct feedback when they 
#     enter an email that has already been used?
#     validates_exclusion_of :email, in: ->(user) { [user.email] }, message: 'Sorry! This email is already in use'
    
    
    
    #     double check
    #     ensures case sensitive
#     if User.email != nil || User.email != ''
#         User.email = User.email.downcase
#     end #or should I use :case_sensitive ?
    before_validation :email_to_downcase
    
    def email_to_downcase
        email.try(:downcase!)
    end
end
