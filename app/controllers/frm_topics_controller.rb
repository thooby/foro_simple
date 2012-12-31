class FrmTopicsController < ApplicationController  
  def show
    @topic = FrmTopic.find(params[:id])
    @topic.hit! if @topic
  end
  
  def new
    @forum = FrmForum.find(params[:frm_forum_id])
    @topic = FrmTopic.new
  end
  
  def create
    @forum = FrmForum.find(params[:frm_forum_id])
    @topic = @forum.frm_topics.build(params[:frm_topic])
    @topic.user = current_user
    if @topic.save
      flash[:notice] = :topic_was_successfully_created
      redirect_to frm_topic_url(@topic)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @topic = FrmTopic.find(params[:id])
  end
  
  def update
    @topic = FrmTopic.find(params[:id])
    if @topic.update_attributes(params[:frm_topic])
      flash[:notice] = :topic_was_updated_successfully
      redirect_to frm_topic_url(@topic)
    end
  end

  def destroy
    @topic = FrmTopic.find(params[:id])
    
    if @topic.destroy
      flash[:notice] = :topic_was_deleted_successfully
      redirect_to frm_forum_url(@topic.frm_forum)
    end
  end
end
