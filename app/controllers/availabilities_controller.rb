class AvailabilitiesController < ApplicationController
	def new 
		@availability = Availability.new
	end

	def create
		@availability = Availability.new(params[])
		@availability.save
	end

	def update

	end

	def show

	end

	def destroy 

	end

end
