class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def upvote
    @book = Book.find(params[:id])
    @book.increment!(:rank)
    redirect_to book_path(@book)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
