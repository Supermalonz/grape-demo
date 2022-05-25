class CreateKeyWords < ActiveRecord::Migration[7.0]
  def change
    create_table :keywords do |t|
      t.string :title

      t.timestamps
    end
  end
end
