class ShiftSerializer < ActiveModel::Serializer
  attributes :id, :day, :start_at, :end_at, :duration, :role, :color
end
