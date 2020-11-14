class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :document
      t.integer :type_document
      t.timestamps
    end
  end
end
