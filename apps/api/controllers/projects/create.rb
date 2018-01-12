module Api::Controllers::Projects
  class Create
    include Api::Action

    params do
      required(:name).filled
      optional(:description).filled
    end

    expose :project

    def call(params)
      @project = ProjectRepository.new.create(params.to_h)
    end
  end
end
