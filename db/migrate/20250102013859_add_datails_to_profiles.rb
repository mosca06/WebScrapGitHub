class AddDatailsToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :stars_count, :integer
    add_column :profiles, :repositories_count, :integer
    add_column :profiles, :followers_count, :integer
    add_column :profiles, :following_count, :integer
    add_column :profiles, :company, :string
    add_column :profiles, :location, :string
    add_column :profiles, :linkedin, :string
  end
end
