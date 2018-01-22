module Api::Controllers::ProjectRun
  class Show
    include Api::Action

    expose :project_run

    def call(params)
      @project_run = repository.find(params[:id])
    end

    private

    def repository
      @repository ||= ProjectRunRepository.new
    end
  end
end
