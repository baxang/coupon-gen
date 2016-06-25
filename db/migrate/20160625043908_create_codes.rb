class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.references :campaign, type: :uuid
      t.string :code, null: false
      t.datetime :redeemed_at

      t.timestamps
    end
    add_index :codes, [:campaign_id, :code], unique: true
  end
end
