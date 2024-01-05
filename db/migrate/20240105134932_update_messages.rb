class UpdateMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :user, foreign_key: true
    add_reference :messages, :room, foreign_key: true
    add_column :messages, :body, :text
  end
end
