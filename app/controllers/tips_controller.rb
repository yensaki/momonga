class TipsController < ApplicationController
  def index
    @tips = Tip.all
    @tips = @tips.where(title: params[:q]) if params[:q].present?
  end
end
