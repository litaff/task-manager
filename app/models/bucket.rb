class Bucket < ApplicationRecord
  belongs_to :user
  has_many :tasks

    def self.get_by_owner(id)
      self.find_by(user_id: id)
    end

    def tasks_by_status(status)
        self.tasks.select do |task|
            task.status == status
        end
    end
end
