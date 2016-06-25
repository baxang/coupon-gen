class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.string :title
      t.integer :max_code, null: false

      t.timestamps
    end
  end
end
