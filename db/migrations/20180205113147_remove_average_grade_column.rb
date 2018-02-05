Hanami::Model.migration do
  up do
    drop_column :project_runs, :average_grade
    set_column_type :project_runs, :completion, String
    set_column_default :project_runs, :completion, nil
  end

  down do
    add_column :project_runs, :average_grade, String, default: 'N/A'
    set_column_type :project_runs, :completion, Integer, using: 'completion::integer'
    set_column_default :project_runs, :completion, 0
  end
end
