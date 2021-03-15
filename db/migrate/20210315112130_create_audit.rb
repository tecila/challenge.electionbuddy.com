class CreateAudit < ActiveRecord::Migration[6.0]
  def change
    create_table :audits do |t|
      t.references :user, foreign_key: true
      t.string :auditable_type
      t.integer :auditable_id
      t.json :audit_changes, null: false
      t.index ["auditable_type", "auditable_id"]

      t.timestamps
    end
  end
end
