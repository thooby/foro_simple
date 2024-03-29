class FrmForumsController < ApplicationController    
  def show
    @forum = FrmForum.find(params[:id])
  end
  
  def new
    @forum = FrmForum.new
  end
  
  def create
    @forum = FrmForum.new(params[:frm_forum])  
    if @forum.save
      flash[:notice] = :forum_was_successfully_created
      redirect_to frm_forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @forum = FrmForum.find(params[:id])
  end
  
  def update
    @forum = FrmForum.find(params[:id])
    if @forum.update_attributes(params[:frm_forum])
      flash[:notice] = :forum_was_updated_successfully
      redirect_to frm_forum_url(@forum)
    end
  end
  
  def destroy
    @forum = FrmForum.find(params[:id])
    
    if @forum.destroy
      flash[:notice] = :forum_was_deleted
      redirect_to frm_forums_url
    end
  end
end