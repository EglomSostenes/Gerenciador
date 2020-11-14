class AddTypeUserToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :type_user, :integer
  end
end
