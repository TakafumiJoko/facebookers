class RenameOpinionColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :opinion, :introduction
  end
end
