class EventRegister
  include Dry::Events::Publisher[:fake_cf_api_publisher]
  ROUTING_COLLECTION = %w(fake_project_runner.project_run.update).freeze

  ROUTING_COLLECTION.each do |routing|
    register_event(routing)
  end
end
