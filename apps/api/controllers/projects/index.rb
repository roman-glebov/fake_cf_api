module Api::Controllers::Projects
  class Index
    include Api::Action
    accept :json

    expose :projects

    def call(params)
      @projects = ProjectRepository.new.all
    end
  end
end
