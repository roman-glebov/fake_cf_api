module Api::Controllers::Projects
  class Update
    include Api::Action

    params do
      required(:name).filled
      optional(:description).filled
      optional(:test_ids).filled
    end

    expose :project

    def call(params)
      @project = ProjectRepository.new.update(params[:id], params.to_h)
    end
  end
end
