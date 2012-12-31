class FrmCategoriesController < ApplicationController  
  def index
    @categories = FrmCategory.all
  end
  
  def new
    @category = FrmCategory.new
  end
  
  def create
    @category = FrmCategory.new(params[:frm_category])
    if @category.save
      flash[:notice] = :category_was_successfully_created
      redirect_to frm_forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @category = FrmCategory.find(params[:id])
  end
  
  def update
    @category = FrmCategory.find(params[:id])
    
    if @category.update_attributes(params[:frm_category])
      flash[:notice] = :category_was_updated_successfully
      redirect_to frm_forums_url
    end
  end
  
  def destroy
    @category = FrmCategory.find(params[:id])
    
    if @category.destroy
      flash[:notice] = :category_was_deleted
      redirect_to frm_forums_url
    end
  end
end