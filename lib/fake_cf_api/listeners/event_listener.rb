class EventListener
  def on_fake_project_runner_project_run_update(event)
    UpdateProjectRun.new.call(event[:payload])
  end
end
