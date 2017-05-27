class TasksController < ApplicationController
	before_action :task_params, :only => :create 
	def create
		@meeting = Meeting.find(params[:meeting_id])
		@task = Task.new(@task)
		@task[:meeting_id] = @meeting.id
		if @task.save!
			redirect_to meeting_path(@meeting.id)
		end
	end


private

	def task_params
		@task = params.require(:task).permit(:task, :title, :description, :meeting_id,:data)
	end

end