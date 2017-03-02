class AddIssueActionToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :issue, :string
    add_column :answers, :action, :text
  end
end
