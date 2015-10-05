# class ProjectsController < ApplicationController
#   def index
#   end

#   def show
#   end

#   def new
#   end

#   def edit
#   end
# end


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

    def edit
        @project = Project.find(params[:id])
    end

    def create

        @project = Project.new(project_params)
        @project.user_id = current_user.id

        if @project.save
            redirect_to projects_path, notice: "#{@project.title} was submitted successfully!"
        else
            render :new
        end
    end

    def update
        @project = Project.find(params[:id])

        if @project.update_attributes(project_params)
            redirect_to project_path(@project)
        else
            render :edit
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
    end

    protected

    def project_params
        params.require(:project).permit(
            :title, :description, :time_estimate, :time_start, :time_end, :reward_monetary, :reward_non_monetary,
            )
    end

end