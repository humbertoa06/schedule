FactoryBot.define do
  factory :employee do
    first_name { 'Alfred' }
    last_name { 'Brown' }

    trait :with_shifts do
      transient do
        shifts_count { 4 }
      end

      after(:create) do |employee, evaluator|
        create_list(:shift, evaluator.shifts_count, employee: employee)
      end
    end
  end
end
