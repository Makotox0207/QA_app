class AddUserIdToQuestions < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM questions;'
    add_reference :questions, :user, null: false, index: true
  end
  def down
    remove_reference :qustions, :user, index: true
  end
end
