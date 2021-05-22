class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @user_img = @book.user
  end

  def create
    @book =Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render "index"
    end
    flash[:notice] = "Book was successfully created."
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = current_user

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    else
    render "show"
    end
    flash[:notice] = "Book was successfully created."
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully created."
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end