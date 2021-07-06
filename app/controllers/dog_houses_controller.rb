class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    dog_house = DogHouse.find(params[:id])
    render json: dog_house
  end



  def reviews_index
   dog_house= DogHouse.find(params[:dog_house_id])
   render json: dog_house.reviews 
  end
  

  def review
    dog_house= DogHouse.find(params[:dog_house_id])
    review= dog_house.reviews.find(params[:review_id])
     render json: review 
  end





  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
