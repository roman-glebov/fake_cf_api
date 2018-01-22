module Api::Controllers::Projects
  class StartProject
    include Api::Action

    params do
      required(:action).filled
    end

    expose :project
    expose :project_run

    def call(params)
      @project = repository.find(params[:id])
      @project_run = repository.add_project_run(@project)
      Sneakers.publish(params.to_h.merge(project_run_id: @project_run.id.to_s, test_ids: @project.test_ids).to_json,
                      routing_key: 'fake_cf_api.project_run.start')
    end

    private

    def repository
      @repository ||= ProjectRepository.new
    end
  end
end
