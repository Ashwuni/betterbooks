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
      flash[:notice] = 'Author was successfully updated.' 
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
    if @author.destroy
        flash[:notice] = 'Unable to delete author.'
    else
        if Book.count > 0 
            flash[:notice] = 'This author has several books saved. Do you wish to delete all their books as well?'
            
#             list = ''
#             books.all.each do |book|
#                 if book.author == #book author
#                     list = list+''+ #book
#                 end
            
                    
            list = Author.where(book.author == #book author).take
                
            flash[:notice] = list.to_s
            #show books Book.find(params[:id])^^
            #take input whether to delete books or not
            
            flash[:notice] = 'Please type Y to confirm delete.'
            choice = params[:choice]
            if choice.to_s == 'Y'
                #user confirms delete
                #show below on index page
                @author.destroy
                
                books.all.each do |book|
#                 if book.author == #book author
                    @book.destroy
                    flash[:notice] = 'Author was successfully deleted.'
                    #redirect???
#                 end
            else
                flash[:notice] = 'Unable to delete author.'
        else
            flash[:notice] = 'Unable to delete author.'
        end
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
