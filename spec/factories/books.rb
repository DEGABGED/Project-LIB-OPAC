FactoryGirl.define do
  factory :book do
    title   { Faker::Educator.course }
    author  { Faker::Lorem.word }
    section { Book::SECTIONS[rand(Book::SECTIONS.size)] }
    batch   { rand(10) }
    size    { rand(2) }

    trait :discont do
      status  { :discont }
    end

    trait :on_circ do
      status  { :on_circ }
    end
  end
end
