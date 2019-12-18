class Meeting < ApplicationRecord
  belongs_to :team
  belongs_to :user

  # accepts_nested_attributes_for :users, allow_destroy: true
  # accepts_nested_attributes_for :teams
end
