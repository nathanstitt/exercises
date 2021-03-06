FactoryGirl.define do
  factory :exercise do
    title { Faker::Lorem.words.join(' ').capitalize }
    stimulus { Faker::Lorem.paragraph }

    transient do
      questions_count { questions.empty? ? 1 : 0 }
      stems_count 1
      answers_count 3
    end

    after(:build) do |exercise, evaluator|
      exercise.publication ||= build(:publication, publishable: exercise)
      evaluator.questions_count.times do
        exercise.questions << build(:question, exercise: exercise,
                                    stems_count: evaluator.stems_count,
                                    answers_count: evaluator.answers_count)
      end
    end

    trait :published do
      after(:build) do |exercise|
        exercise.publication.published_at = Time.now
      end
    end
  end
end
