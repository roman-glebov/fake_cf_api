Hanami::Model.migration do
  change do
    create_table :project_runs do
      primary_key :id
      foreign_key :project_id, :projects, on_delete: :cascade, null: false

      column :status, String, null: false, default: 'starting'
      column :average_grade, String, default: 'N/A'
      column :completion, Integer, default: 0
      column :active_tests, Integer, default: 0
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false

      index :project_id
    end
  end
end
