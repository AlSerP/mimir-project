class ProjectsController < ApplicationController
  def index
		@projects = Project.all
  end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create(project_params)
		
		if @project.save
			redirect_to @project
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])

		if project.update(project_params)
			redirect_to @article
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.delete

		redirect_to projects_path
	end

	private

	def project_params
		params.require(:project).permit(:title, :description)
	end
end
