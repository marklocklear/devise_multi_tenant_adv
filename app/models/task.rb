class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :user_id

#Calling this from the controller for multi-tenancy
  def self.get_tasks(current_user)
    if current_user.role == 'admin'
      current_user.organization.tasks
    else
      current_user.tasks
    end
  end
end
