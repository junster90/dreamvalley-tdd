class ChangeColumnNameInGoals < ActiveRecord::Migration
  def change
    rename_column :goals, :type, :category
  end
end
