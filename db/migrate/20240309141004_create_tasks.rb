class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks, id: :uuid, default: "gen_random_uuid()" do |t|
      t.string :title, null: false
      t.text :description, null: false, default: ''
      t.datetime :deadline, null: true
      t.references :project, type: :uuid, null: false, foreign_key: true
      t.references :created_by, type: :uuid, null: true, foreign_key: {to_table: :users}
      t.references :assigned_to, type: :uuid, null: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
