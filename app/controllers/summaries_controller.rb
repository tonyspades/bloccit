class SummariesController < ApplicationController
  def new
  	@topic = Topic.find(params[:topic_id])
    @post = Post.new
  	@summary = Summary.new
  	authorize @summary
  end

  def show
  	@topic = Topic.find(params[:id])
  	@posts = @topic.posts
  	@summary = @posts.summary
    authorize @topic
  end

  def edit
  	@summary = Summary.find(params[:id])
  	authorize @summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts
    @summary = Summary.new(params.require(:summary).permit(:description))
    authorize @summary
    if @summary.save
      flash[:notice] = "Your post summary was saved"
      redirect_to [@topic, @post]
    else 
      flash[:error] = "Sorry. There was an error saving your summary. Please try again"
      render :new
    end
  end

  def update
     @summary = Summary.find(params[:id])
     authorize @summary
     if @summary.update_attributes(params.require(:summary).permit(:description))
       redirect_to @summary
     else
       flash[:error] = "Error saving summary. Please try again."
       render :edit
     end
   end
end
