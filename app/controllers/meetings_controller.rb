class MeetingsController < ApplicationController

	before_action :authenticate_user!
	before_action :meeting_params, :only => :create

	def index
		@meetings = Meeting.all 
	end

	def new
		@meeting = Meeting.new
	end

#sanitize - create. 

	def create
			@meeting[:user_id] = current_user.id
			@meeting[:start_at] = @meeting[:start_at].to_s.reverse.gsub!('=>', '/') 
	 		@createm = Meeting.new(@meeting) 
		#@meeting = Meeting.new(params[:meeting_params])
			
			
			if @createm.save
				redirect_to meeting_path(Meeting.last) #!h
			end
	end


	def show
		@meeting = Meeting.find(params[:id])
		@tasks = Task.where(meeting_id: @meeting.id )
		@task = Task.new
		@task[:meeting_id] = params[:id]

		if @meeting.user_id == current_user.id
			@romeo = true 
		else
			@rome = false 
		end 

	end

	#  
	#  
	# 
	# 
	# 
	def delete
		
	end

	def addtask
	  
	end

	private

	def meeting_params 
		@meeting = params.require(:meeting).permit(:start_at, :title, :description, :user_id)
	end

end