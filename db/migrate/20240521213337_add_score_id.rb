# frozen_string_literal: true

class AddScoreId < ActiveRecord::Migration[7.1]
  def change
    add_column :scores, :user_id, :int
  end
end
