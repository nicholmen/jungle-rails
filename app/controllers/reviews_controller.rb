class ReviewsController < ApplicationController
  # def show
  #   @review = Review.find(params[:id])
  # end
  
  # def new
  # end
  before_filter :user_logged_in?
 
  def create
    @review = Review.new
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]
    @review.description = params[:review][:description]
    @review.rating = params[:review][:rating]
    @review.save!
    redirect_to :controller=>'products', :action=>'show', :id=>params[:product_id]
  end

  def destroy
    puts 'we are in the delete method of reviews'
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :controller=>'products', :action=>'show', :id=>params[:product_id]

 
  end

end
