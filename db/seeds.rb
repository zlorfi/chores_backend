Task.destroy_all
Day.destroy_all
User.destroy_all
Chore.destroy_all

User.create!({ name: 'Michi', email: 'zlorfi@gmail.com', can_edit: true })

20.times do
  Chore.create!({
                  title: Faker::Hipster.sentence(word_count: 4),
                  monday: Faker::Boolean.boolean(true_ratio: 0.4),
                  tuesday: Faker::Boolean.boolean(true_ratio: 0.4),
                  wednesday: Faker::Boolean.boolean(true_ratio: 0.1),
                  thursday: Faker::Boolean.boolean(true_ratio: 0.4),
                  friday: Faker::Boolean.boolean(true_ratio: 0.4),
                  saturday: Faker::Boolean.boolean(true_ratio: 0.3),
                  sunday: Faker::Boolean.boolean(true_ratio: 0.2)
                })
end

Day.create!({ user: User.first })
