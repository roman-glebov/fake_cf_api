module Api::Views::Projects
  class RunProject
    include Api::View

    def render
      project_run = {
        projectId: project.id,
        projectRunId: '3d6263190af74e7193a82ca2c7fe8',
        status: params[:action]
      }
      raw JSON.generate(project_run)
    end
  end
end
