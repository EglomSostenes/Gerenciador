class AddCnaeToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :cnae, :string
  end
end
