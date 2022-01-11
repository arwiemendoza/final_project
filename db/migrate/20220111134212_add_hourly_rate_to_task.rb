class AddHourlyRateToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :hourly_rate, :float
  end
end
