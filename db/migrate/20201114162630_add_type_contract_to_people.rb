class AddTypeContractToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :type_contract, :integer
  end
end
