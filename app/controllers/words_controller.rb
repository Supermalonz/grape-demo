class WordsController < ApplicationController

  def index; end

  def import
    @file = params[:file]
    FileHandler
  end
end
