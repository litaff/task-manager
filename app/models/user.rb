class User < ApplicationRecord
  has_one :bucket
  has_many :tasks
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def tasks_by_status(status)
    self.tasks.select do |task|
      task.status == status
    end
  end
end
