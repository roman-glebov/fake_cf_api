class ProjectRunUpdateListener
  include Sneakers::Worker
  from_queue 'fake_project_runner.project_run.update'

  def work(msg)
    message = JSON.parse(msg)
    result = UpdateProjectRun.new.call(message)
    if result.successful?
      Sneakers.publish(result.project_run.to_h.to_json, routing_key: 'fake_cf_api.project_run.update')
    else
      Sneakers.publish(result.error, routing_key: 'fake_cf_api.project_run.update.error')
    end
    ack!
  end
end
