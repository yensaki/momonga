class RootController < ApplicationController
  def index
    @tips = Tip.all
  end
end
