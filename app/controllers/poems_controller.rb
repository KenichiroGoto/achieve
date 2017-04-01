class PoemsController < ApplicationController

  def index
    @poems = Poem.all
  end

  # add show action for normal gate of dive14_2
  def show
    @poem = Poem.find(params[:id])
  end

end
