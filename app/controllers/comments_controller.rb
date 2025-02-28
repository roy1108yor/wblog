class CommentsController < ApplicationController
  layout false

  def create
    cookies[:name] = comment_params[:name]
    cookies[:email] = comment_params[:email]

    @post = Post.find( params[:blog_id] )
    @comments = @post.comments.order(created_at: :desc)

    Rails.logger.info "Processing comment for post ##{@post.id}"

    @comment = @post.comments.build(comment_params)
    
    respond_to do |format|
      if @comment.save
        Rails.logger.info "Comment saved successfully: #{@comment.id}"
        flash.now[:notice] = '发表成功'
        # 重置评论
        @comment = Comment.new
        
        format.html { redirect_to blog_path(@post) }
        format.turbo_stream
        format.js
      else
        Rails.logger.error "Failed to save comment: #{@comment.errors.full_messages.join(', ')}"
        format.html { render :create }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment-form', partial: 'blogs/comment', locals: { post: @post, comment: @comment }) }
        format.js
      end
    end
  end

  def refresh
    @post = Post.find(params[:blog_id])
    @comments = @post.comments.order(created_at: :desc)
    
    respond_to do |format|
      format.html
      format.turbo_stream
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :name, :email)
  end
end