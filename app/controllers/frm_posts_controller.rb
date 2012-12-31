class FrmPostsController < ApplicationController    
  def new
    @topic = FrmTopic.find(params[:frm_topic_id])
    @post = FrmPost.new
    
    if params[:quote]
      quote_post = FrmPost.find(params[:quote])
      if quote_post
        @post.body = quote_post.body
      end
    end
  end
  
  def create
    @topic = FrmTopic.find(params[:frm_topic_id])
    @post = @topic.frm_posts.build(params[:frm_post])
    @post.frm_forum = @topic.frm_forum
    @post.user = current_user
    
    if @post.save
      flash[:notice] = :post_was_successfully_created
      redirect_to frm_topic_path(@post.frm_topic)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = FrmPost.find(params[:id])
  end
  
  def update
    @post = FrmPost.find(params[:id])

    if @post.update_attributes(params[:frm_post])
      flash[:notice] = :post_was_successfully_updated
      redirect_to frm_topic_path(@post.frm_topic)
    end
  end
  
  def destroy
    @post = FrmPost.find(params[:id])
    
    if @post.frm_topic.frm_posts_count > 1
      if @post.destroy
        flash[:notice] = :post_was_successfully_destroyed
        redirect_to frm_topic_path(@post.frm_topic)
      end
    else
      if @post.frm_topic.destroy
        flash[:notice] = :topic_was_successfully_deleted
        redirect_to frm_forum_path(@post.frm_forum)
      end
    end
  end
end