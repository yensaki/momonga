class TipsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update destroy)

  def index
    @tips = Tip.all
    @tips = @tips.where(title: params[:q]) if params[:q].present?
  end

  def new
    @tip = Tip.new(user: current_user)
  end

  def create
    @tip = Tip.new(tip_params.merge(user: current_user))

    if @tip.save
      redirect_to tip_url(@tip)
    else
      render :new
    end
  end

  def show
    @tip = Tip.find(params[:id])
  end

  private

  def tip_params
    params.require(:tip).permit(:title, tip_body_attributes: %i(content))
  end
end
