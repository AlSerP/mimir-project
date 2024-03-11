class Project < ApplicationRecord
  has_many :tasks
  
  after_create_commit { broadcast_prepend_to :projects }
end
