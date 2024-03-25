class Task < ApplicationRecord
  belongs_to :project
  # has_one :created_by, class_name: 'User', foreign_key: 'created_by_id'
  # has_one :assigned_to, class_name: 'User', foreign_key: 'assigned_to_id'

  enum status: [:to_do, :in_progress, :completed]

  def created_by
    User.find_by(id: created_by_id)
  end

  def assigned_to
    User.find_by(id: assigned_to_id)
  end
end
