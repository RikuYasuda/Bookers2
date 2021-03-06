class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    book = Book.find(params[:book_id])
    comment = current_user.comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
  end

  def destroy
    Comment.find_by(id: params[:id], book_id: params[:book_id]).destroy
  end

  private
  def book_comment_params
    params.require(:comment).permit(:comment)
  end
end
