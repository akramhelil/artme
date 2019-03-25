class AddTimeRequiredToArts < ActiveRecord::Migration[5.2]
  def change
    add_column :arts, :time_required, :integer
  end
end
