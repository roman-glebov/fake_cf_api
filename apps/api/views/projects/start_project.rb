module Api::Views::Projects
  class StartProject
    include Api::View

    def render
      project_run_info = {
        projectId: project.id,
        projectRunId: project_run.id,
        status: project_run.status
      }
      raw JSON.generate(project_run_info)
    end
  end
end
