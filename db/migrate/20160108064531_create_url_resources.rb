class CreateUrlResources < ActiveRecord::Migration
  def change
    create_table :url_resources do |t|
      t.string :url

      t.timestamps null: false
    end
  end
end
