FactoryBot.define do
  factory :user do
    name { generate :name }
    email { generate :email }
    password { 'password' }
    matricula { generate :matricula }

    trait :admin do
      role { 'admin' }
    end

    trait :professor do
      role { 'professor' }
    end

    trait :sec do
      role { 'sec' }
    end

  end
  factory :aluno do
    nome { generate :name }
    email { generate :email }
    matricula { generate :matricula }
  end
  sequence :name do |n|
    "John #{n} Doe"
  end
  sequence :email do |n|
    "email#{n}@gmail.com"
  end
  sequence :matricula, &:to_s
end
