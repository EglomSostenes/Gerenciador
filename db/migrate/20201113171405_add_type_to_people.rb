class AddTypeToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :type, :string
  end
end
