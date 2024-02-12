class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params) # データを受け取り新規投稿するためのインスタンス作成
    if @book.save # データをデータベースに保存するためのsaveメソッド
    flash[:notice] = "Book was successfully created." # フラッシュメッセージを実装し、詳細画面へリダイレクト
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index','edit'
    end
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed." # フラッシュメッセージを設定
    redirect_to books_path, flash: {notice: "Book was successfully destroyed."}
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params) && book.valid?
      flash[:notice] = "Book was successfully updated."
      else
        flash[:notice] = "Error."
      end
      redirect_to book_path(book.id)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end