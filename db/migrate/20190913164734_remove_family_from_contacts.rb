class RemoveFamilyFromContacts < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :friends, :string 
  end
end
