class FixRuleColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :rules, :name, :value
  end
end
