# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

employees = [
  {
    first_name: 'Alfred',
    last_name:  'Brown',
    shifts: [
      {
        day: 0,
        start_at: "12pm",
        end_at: "5pm",
        duration: 5,
        role: "Server",
        color: "red"
      },
      {
        day: 1,
        start_at: "9am",
        end_at: "12pm",
        duration: 3,
        role: "Host",
        color: "green"
      },
      {
        day: 3,
        start_at: "9am",
        end_at: "4pm",
        duration: 7,
        role: "Server",
        color: "red"
      },
      {
        day: 5,
        start_at: "9am",
        end_at: "2pm",
        duration: 5,
        role: "Host",
        color: "green"
      }
    ]
  },
  {
    first_name: 'Tim',
    last_name:  'Cannady',
    shifts: [
      {
        day: 0,
        start_at: "11am",
        end_at: "6pm",
        duration: 7,
        role: "Chef",
        color: "orange"
      },
      {
        day: 1,
        start_at: "9am",
        end_at: "3pm",
        duration: 6,
        role: "Dishwasher",
        color: "purple"
      },
      {
        day: 2,
        start_at: "9am",
        end_at: "1pm",
        duration: 4,
        role: "Chef",
        color: "orange"
      },
      {
        day: 5,
        start_at: "9pm",
        end_at: "4am",
        duration: 7,
        role: "Dishwasher",
        color: "purple"
      }
    ]
  },
  {
    first_name: 'Jeff',
    last_name:  'Auston',
    shifts: [
      {
        day: 1,
        start_at: "11am",
        end_at: "6pm",
        duration: 7,
        role: "Chef",
        color: "orange"
      },
      {
        day: 2,
        start_at: "9am",
        end_at: "3pm",
        duration: 6,
        role: "Dishwasher",
        color: "purple"
      },
      {
        day: 4,
        start_at: "9am",
        end_at: "1pm",
        duration: 4,
        role: "Chef",
        color: "orange"
      },
      {
        day: 6,
        start_at: "9am",
        end_at: "4pm",
        duration: 7,
        role: "Dishwasher",
        color: "purple"
      }
    ]
  }
]

ActiveRecord::Base.transaction do
  employees.each do |employee_data|
    shifts_data = employee_data.delete(:shifts)

    employee = Employee.create!(employee_data)

    employee.shifts.create!(shifts_data)
  end
end
