class AuthorsController < ApplicationController

  # GET /authors
  def index
    @authors = Author.all
  end

  # GET /authors/:id
  def show
    @author = Author.find(params[:id])
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/:id/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  def create
    # active record new, create, and update allow us to pass in a hash with the
    # attributes and their values, author_params is a method (see below!)      
    @author = Author.new(author_params)

    if @author.save
      flash[:notice] = 'Author was successfully created.' 
      redirect_to @author
    else
      render :new
    end
  end

  # PATCH/PUT /authors/:id
  def update
    @author = Author.find(params[:id])      
    if @author.update(author_params)
      flash[:notice] = 'Author successfully updated.' 
      redirect_to @author 
    else
      render :edit
    end
  end

  # GET /authors/:id/confirm_delete  
  def confirm_delete
      @author = Author.find(params[:id])
      # show the form for confirm_delete of user 
  end        
    
  # DELETE /authors/:id
  def destroy
    @author = Author.find(params[:id])  
      
#     temp = books.select(:id).to_a
#     temp.each do |x|
#         @book = Book.find(x.id)
#     end
    
    
    
    if @author.num_books>0
            
                    
#             list = Author.where(book.author == #book author).take
                
#             flash[:notice] = list.to_s
            #show books Book.find(params[:id])^^
            #take input whether to delete books or not
            
#             flash[:notice] = 'Please type Y to confirm delete.'
#             choice = params[:choice]
#             if choice.to_s == 'Y'
                #user confirms delete
                #show below on index page
#                 @author.destroy
            
            
                
         temp = @author.book_id
            array = Array.new
            temp.each do |x|
#                 array = array.push(Book.find(x))
                 @book = Book.find(x)
                
                 list = ''
                 list = list+''+ @book.title
#                 end
#             end
#             
#           
#             books.each do |book|
#                 if book.author == #book author
             if @book.destroy
                 flash[:notice] = 'Author was successfully deleted.'
#                     redirect???
             else
                flash[:notice] = 'Unable to delete book.'
             end
         end
        
        if @author.destroy
        
        
#         if @book.count > 0 
            
             flash[:notice] = 'Author was successfully deleted.'
        
        else
             flash[:notice] = 'Unable to delete author.'
        end
    
#         flash[:notice] = 'Unable to delete author.'
    else
        flash[:notice] = 'Book was successfully deleted.'
    
    end
    redirect_to authors_url 
  end

  private
    # Only allow a trusted parameter "white list" through.
    def author_params
      # params is a hashtable.  It should have in it a key of :author.
      # The value for the :author key is another hash.
      # If params does not contain the key :author, an exception is raised.  
      # Only the "author" hash is returned and only with the permitted key(s).
      params.require(:author).permit(:name)
    end
end
