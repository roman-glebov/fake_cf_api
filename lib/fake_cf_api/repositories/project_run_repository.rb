class ProjectRunRepository < Hanami::Repository
  associations do
    belongs_to :project
  end

  def find_with_project(id)
    aggregate(:project).where(id: id).map_to(ProjectRun).one
  end
end
