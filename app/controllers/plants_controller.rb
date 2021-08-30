
    class PlantsController < ApplicationController
      # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

        # GET /plants
        def index
          plants = Plant.all
          render json: plants
        end
      
        # GET /plants/:id
        def show
          plant = Plant.find_by(id: params[:id])
          render json: plant
        end
 
        def create 
            plant = Plant.create(plant_params)
            render json: plant, status: :created
        end

        def destroy 
          plant = Plant.find_by(id: params[:id])
          plant.destroy
          head :no_content
        end

        def update
          plant = Plant.find(id: params[:id])
            plant.update(plant_params)
            render json: plant
          
        end




        private 


        def plant_params
            params.permit(:name, :image, :price, :in_in_stock)
            
        end
    
    
    end