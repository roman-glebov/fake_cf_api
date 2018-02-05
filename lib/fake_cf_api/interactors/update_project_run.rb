require 'hanami/interactor'

class UpdateProjectRun
  include Hanami::Interactor

  expose :project_run

  def initialize(repository: ProjectRunRepository.new)
    @repository = repository
  end

  def call(attributes)
    @project_run = @repository.update(attributes['cf_project_run_id'],
                                      status: attributes['status'],
                                      completion: attributes['completion'],
                                      active_tests: attributes['active_tests'])
  rescue StandardError => e
    error e.message
  end
end
