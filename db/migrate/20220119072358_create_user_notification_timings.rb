class CreateUserNotificationTimings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_notification_timings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :notification_timing, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_notification_timings, [:user_id, :notification_timing_id], unique: true, name: 'idx_usr_ntf_timings_on_user_id_and_notification_timing_id'
  end
end
