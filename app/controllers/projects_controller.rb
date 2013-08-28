class ProjectsController < ApplicationController
	before_action :signed_in_user, only: [:create, :edit, :destroy]
	before_action :correct_user, only: [:destroy, :edit]

	def index
		#@project = Project.new
		@projects = Project.paginate(page: params[:page])
	end

	def create
		@project = current_user.projects.build(project_params)
		if @project.save
			flash[:success] = "Project created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def edit
	end

	def new
		@project = Project.new
		#redirect_to 'projects/show'
	end

	def show

	end

	def destroy
		@project.destroy
		redirect_to root_url
	end

	private

		def project_params
			params.require(:project).permit(:title)
		end

		def correct_user
			@project = current_user.projects.find_by(id: params[:id])
			redirect_to root_url if @project.nil?
		end

end