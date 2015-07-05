class CreateLabels < ActiveRecord::Migration
  def up
    create_table :labels do |t|
      t.string :label
      t.text :content_fr, :content_en
      t.timestamps
    end
  end

  def down
    drop_table :labels
  end
end
