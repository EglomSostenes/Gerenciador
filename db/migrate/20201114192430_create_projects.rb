class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :justification
      t.string :goals
      t.float :cost
      t.references :alliance, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
