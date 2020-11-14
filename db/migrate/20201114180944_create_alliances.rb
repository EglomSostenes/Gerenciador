class CreateAlliances < ActiveRecord::Migration[6.0]
  def change
    create_table :alliances do |t|
      t.date :start_date
      t.date :end_date
      t.belongs_to :company
      t.belongs_to :institution

      t.timestamps
    end
  end
end
