class Author < ApplicationRecord
  has_many :books    
   
#     The web app user interface should 
#     make use of Author model validations 
#     to give feedback to users when their 
#     input is invalid?
    
  validates_presence_of :name, message: 'Must include first name!'
  validates_presence_of :lastname, message: 'Must include last name!'
  validates_length_of :name, maximum: 35, message: 'First name cannot be more than 35 characters long!'
  validates_length_of :lastname, maximum: 35, message: 'Last name cannot be more than 35 characters long!'
    
  def num_books
     books.length     
  end
    
  # Creates and array of arrays to use in dropdown selects for author. For more info:  
  # https://guides.rubyonrails.org/form_helpers.html#select-boxes-for-dealing-with-model-objects
  def self.to_nested_array_for_select
     nested = []  
     Author.order(:name).each do |author|
         fullname = author.name+' '+author.lastname
         nested.push [fullname, author.id]
     end
     return nested 
  end
    
    
  def book_id
      book_ids = Array.new
      id = books.select(:id).to_a
      id.each do |x|
          book_ids.push(x.id)
      end
      
      return book_ids
  end

  def lister 
      book_ids = Array.new
      id = books.select(:id).to_a
      id.each do |x|
          book_ids.push(Book.find(x.id).title)
      end
      
      return book_ids
  end
    
end
