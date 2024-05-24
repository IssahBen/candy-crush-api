# frozen_string_literal: true

class RenameModel < ActiveRecord::Migration[7.1]
  def change
    rename_table :models, :users
  end
end
