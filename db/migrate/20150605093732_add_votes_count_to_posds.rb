class AddVotesCountToPosds < ActiveRecord::Migration
  def change
  	add_column :posds, :votes_count, :integer, default: 0
  end
end
