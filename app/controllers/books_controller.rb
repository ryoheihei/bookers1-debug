class BooksController < ApplicationController


  def toppage

  end
  # GET /books
  # GET /books.json
  def index
    @book = Book.new
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
     @book = Book.find(params[:id])
  end

  # GET /books/1/edit
  def edit
     @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    elsif @book.errors.any?
      @books = Book.all

      render 'index'
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] ='Book was successfully updated.'
       redirect_to book_path(@book.id)
    elsif @book.errors.any?
      render 'edit'
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    book = Book.find(params[:id])
      book.destroy
      redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
