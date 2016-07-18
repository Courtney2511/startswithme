class TextsController < ApplicationController
  def index
    @texts = Text.all
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    if @text.save
      redirect_to texts_url
    else
      render :new
    end
  end

  def show
    @text = Text.find(params[:id])
  end

  private

  def text_params
    params.require(:text).permit(:text)
  end
  
end
