class RepliesController < ApplicationController
  
  def index

    @replies = Reply.all
  end
  
  def new
  end

  def show
  end

  def edit
  end
end
