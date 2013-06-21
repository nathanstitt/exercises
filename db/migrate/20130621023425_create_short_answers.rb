class CreateShortAnswers < ActiveRecord::Migration
  def change
    create_table :short_answers do |t|
      t.integer :question_id
      t.text :content
      t.text :content_html
      t.string :short_answer
      t.integer :order
      t.decimal :credit

      t.timestamps
    end
  end
end