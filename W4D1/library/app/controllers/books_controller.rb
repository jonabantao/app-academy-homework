class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    render :new
  end

  def create
    new_book = Book.new(book_params)

    new_book.save
    redirect_to books_url
  end

  def destroy
    burned_book = Book.find(params[:id])

    burned_book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
