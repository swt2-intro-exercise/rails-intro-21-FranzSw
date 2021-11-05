class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.create
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)
    
    if @author.save
      redirect_to root_path, notice: "Author #{@author.name} saved!"
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end
  
  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end