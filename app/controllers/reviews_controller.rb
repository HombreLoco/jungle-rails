class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user = current_user
    if @review.valid? && current_user
      @review.save
    else
      flash[:danger] = "Please fill out description and rating"
    end
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user.id == @review.user_id
      @review.delete
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  private
    def review_params
      params.require(:review).permit(
        :description,
        :rating
      )
    end
end
