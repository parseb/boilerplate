class MeetingsController < ApplicationController

	before_action :authenticate_user!
	before_action :meeting_params, :only => :create

	def index
		
	end

	def new
		@meeting = Meeting.new
	end

#sanitize - create. 

	def create
			@meeting[:user_id] = current_user.id #.id
	 		@createm = Meeting.new(@meeting) 
		#@meeting = Meeting.new(params[:meeting_params])
			binding.pry 
			
			if @createm.save
				redirect_to meeting_path(Meeting.last) #!h
			end
	end


	def show
		@meeting = Meeting.find(params[:id])
	end


	def delete
		
	end

	private

	def meeting_params 
		@meeting = params.require(:meeting).permit(:start_at, :title, :description, :user_id)
	end

end