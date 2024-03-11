class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects, id: :uuid, default: "gen_random_uuid()" do |t|
      t.string :title, null: false
      t.text :description, null: false, default: ''

      t.timestamps
    end
  end
end
