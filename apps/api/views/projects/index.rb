module Api::Views::Projects
  class Index
    include Api::View

    def render
      raw JSON.generate(projects.map(&:to_h))
    end
  end
end
