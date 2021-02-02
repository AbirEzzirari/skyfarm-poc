module Api
	module V1
		class PlantsController <ApplicationController
			def index
				plants = Plant.order('created_at DESC');
				render json: {status: 'SUCCESS',message:' Loaded plants', data:plants},status: :ok
			end

			def show
				plant = Plant.find(params[:id]);  
				render json: {status: 'SUCCESS',message:' Loaded plant', data:plant},status: :ok
			end	

			def create
				plant = Plant.new(plant_params)
				if plant.save
					render json: {status: 'SUCCESS',message:' Saved plant', data:plant},status: :ok
				else
					render json: {status: 'ERROR',message:'plant not saved', data:plant.errors},status: :unprocessable_entity
				end	
			end

			def destroy
				plant = Plant.find(params[:id])
				plant.destroy
				render json: {status: 'SUCCESS',message:' Deleted plant', data:plant},status: :ok
			end	
			
			def update
				plant = Plant.find(params[:id]);
				if plant.update_attributes(plant_params)
					render json: {status: 'SUCCESS',message:' Updated plant', data:plant},status: :ok
				else
					render json: {status: 'ERROR',message:'Plant not updated', data:plant.errors},status: :unprocessable_entity
				end
			end
					
			private

			def plant_params
				params.permit(:name, :humidity, :sunlight)
			end
		end 
	end	
end	
