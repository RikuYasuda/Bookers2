class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create
    @book =Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
    if @book.save
      redirect_to book_path(@book.id)
    else
      render "index"
    end
    flash[:notice] = "You have created book successfully."
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user

  end

  def edit
  @book = Book.find(params[:id])
  if @book.user == current_user
  render "edit"
  else
  redirect_to books_path
  end
  end

  def update
    @book = Book.find(params[:id])
    @user = @book.user
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    else
    render "edit"
    end
    flash[:notice] = "You have updated book successfully."
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