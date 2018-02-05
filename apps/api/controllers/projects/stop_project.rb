module Api::Controllers::Projects
  class StopProject
    include Api::Action

    params do
      required(:action).filled
    end

    expose :project
    expose :project_run

    def call(params)
      @project_run = repository.find_last_project_run(params[:id])
      @project = repository.find(params[:id])
      Sneakers.publish({ project_run_id: @project_run[:id] }.to_json,
                       routing_key: 'fake_cf_api.project_run.stop')
    end

    private

    def repository
      @repository ||= ProjectRepository.new
    end

    def project_run_repository
      @project_run_repository ||= ProjectRunRepository.new
    end
  end
end
