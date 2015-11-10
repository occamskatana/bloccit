class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body

      t.timestamps null: false

      t.references :question, index: true, foreign_key: true
    end
  end
end
