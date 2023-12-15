FactoryBot.define do
  factory :shift do
    day { 0 }
    start_at { '12pm' }
    end_at { '5pm' }
    duration { 5 }
    role { 'Server' }
    color { 'red' }

    employee

    trait :different_shift do
      day { 1 }
      start_at { '9am' }
      end_at { '12pm' }
      duration { 3 }
      role { 'Host' }
      color { 'green' }
    end
  end
end
