class ProjectRepository < Hanami::Repository
  associations do
    has_many :project_runs
  end

  def add_project_run(project, data = {})
    assoc(:project_runs, project).add(data)
  end

  def remove_project_run(project, id)
    assoc(:project_runs, project).remove(id)
  end

  def find_with_project_runs(id)
    aggregate(:project_runs).where(id: id).as(Project).one
  end

  def find_last_project_run(id)
    project_runs.where(project_id: id).last
  end
end
