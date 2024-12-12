class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :status, :due_date, :created_at, :updated_at
end
