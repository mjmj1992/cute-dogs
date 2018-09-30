class CreateCuteDoggos < ActiveRecord::Migration
  def change
    create_table :cute_doggos do |t|
      t.string :flickr_id,         null: false, default: ""
      t.string :flickr_owner,      null: false, default: "", unique: true
      t.string :title
      t.datetime :dateupload,      null: false
      t.string :url_o,             null: false, default: ""
      t.string :url_m,             null: false, default: ""
      t.string :url_s,             null: false, default: ""

      t.integer :cuteness_score,   null: false, default: 0 

      t.timestamps null: false
    end
  end
end
