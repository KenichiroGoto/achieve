class CommentsController < ApplicationController
  # コメントを保存、投稿する為のアクション
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。'}
        format.js {render :index}
      else
        format.html {render :new}
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
  end

  def update
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
    @comment.update(comment_params)
    if @comment.save
      redirect_to blog_path(@blog), notice: "コメントを更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
    respond_to do |format|
      @comment.destroy
      format.html {redirect_to blog_path(@blog), 'コメントを削除しました。'}
      format.js {render :index}
    end
  end

  private
    # strong parameter
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end



end
