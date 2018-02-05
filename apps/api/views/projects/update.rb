module Api::Views::Projects
  class Update
    include Api::View

    def render
      raw JSON.generate(project.to_h)
    end
  end
end
