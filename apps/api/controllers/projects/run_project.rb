module Api::Controllers::Projects
  class RunProject
    include Api::Action

    params do
      required(:action).filled
    end

    expose :project

    def call(params)
      @project = ProjectRepository.new.find(params[:id])
      @project.project_run_action(params)
    end
  end
end
