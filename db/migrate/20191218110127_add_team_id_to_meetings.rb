class AddTeamIdToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :team_id, :integer
  end
end
