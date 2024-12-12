class Task < ApplicationRecord
	validates :title, presence: true
  validates :status, presence: true
  validates :due_date, presence: true

  def as_json(options = {})
    super(only: [:id, :title, :description, :status, :due_date])
  end
end
