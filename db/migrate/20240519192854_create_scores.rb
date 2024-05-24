# frozen_string_literal: true

class CreateScores < ActiveRecord::Migration[7.1]
  def change
    create_table :scores do |t|
      t.integer :score

      t.timestamps
    end
  end
end
