class SpicesController < ApplicationController
      # GET /spices
  def index
    spices = Spice.all
    render json: spices
  end


  

  # GET /spices/:id
  def show
    spice = Spice.find_by(id: params[:id])
    if spice
      render json: spice
    else
      render json: { error: "Spice not found" }, status: :not_found
    end
  end



    # POST /spices
    def create
      spice = Spice.create(spice_params)
      render json: spice, status: :created
    end


    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
      end


    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
      end

      
    
   # other controller actions here

   private
   # all methods below here are private
 
   def spice_params
     params.permit(:title, :description, :image, :notes, :ratings)
   end

end
