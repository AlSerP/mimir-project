class Task < ApplicationRecord
  belongs_to :project

  # has_one :created_by, class_name: 'User', foreign_key: 'created_by_id'
  # has_one :assigned_to, class_name: 'User', foreign_key: 'assigned_to_id'
end
