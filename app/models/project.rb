class Project < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_rich_text :description

  accepts_nested_attributes_for :team
end
