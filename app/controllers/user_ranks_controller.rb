class UserRanksController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def create
    user_rank = current_user.user_ranks.build(rank_params)

    if user_rank.save
      flash[:notice] = '登録しました'
    end
    redirect_to user_ranks_url
  end

  def update
  end

  private

  def rank_params
    params.require(:user_rank).permit(:gachi_rule, :rank, :score)
  end
end
