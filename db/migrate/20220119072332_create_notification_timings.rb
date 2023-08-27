class CreateNotificationTimings < ActiveRecord::Migration[6.1]
  def change
    create_table :notification_timings do |t|
      t.integer :timing, null: false

      t.timestamps
    end
  end
end
