module Api::Views::ProjectRun
  class Show
    include Api::View

    def render
      raw JSON.generate(project_run.to_h)
    end
  end
end
