class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    respond_to do |format|
      if @micropost.save
        format.html { redirect_to root_path notice: "Micropost created!" }
        format.js 
      else
        @feed_items = []
        format.html {  render 'welcome/index' }
        format.js 
      end
    end
  end
      
 
def destroy
  @micropost.destroy
  redirect_to root_path
end

private
def correct_user
  @micropost = Micropost.find_by_id(params[:id])
  redirect_to root_url unless current_user?(@micropost.user)
end


end
