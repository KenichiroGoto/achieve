class RelationshipsController < ApplicationController
  # ログイン中のユーザのみに許可できるコントローラ・アクションを指定できる。
  # 今回はRelationshipsContorollerがログイン中ユーザーだけに動く様に制限をかけている.
  before_action :authenticate_user!

  respond_to :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end
end
