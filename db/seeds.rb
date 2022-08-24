puts "🌱 Seeding spices..."

Workout.delete_all
Exercise.delete_all
Category.delete_all
ExerciseWorkout.delete_all

glutes = Category.create(name: "Glutes")
legs = Category.create(name: "Legs")
arms = Category.create(name: "Arms")
back = Category.create(name: "Back")
chest = Category.create(name: "Chest")
other = Category.create(name: "Other")

Exercise.create(name: "Bench Press", description: "Lying on a bench, lower the weight down to chest level and then press upwards while extending arms.", category_id: chest.id)
Exercise.create(name: "Hip Adductor", description: "Move leg toward and across supporting leg. Return and repeat. Reposition roller pad lever and continue with opposite leg.", category_id: glutes.id)
Exercise.create(name: "Standing Dumbbell Curl", description: "Stand by holding a dumbbell in each hand with arms hanging by sides. Keeping upper arms stationary, curl the weights up to shoulder level, then lower.", category_id: arms.id)
Exercise.create(name: "Leg Press", description: "Sitting flat against the seat, extend legs. Pause at top of movement, then slowly lower back down.", category_id: legs.id)
Exercise.create(name: "Barbell Row", description: "With knees slightly bent, stand over barbell, pull bar against lower chest. Slowly lower bar back down.", category_id: back.id)
Exercise.create(name: "Interval Run", description: "Begin at jogging pace. Increase speed every 10 minutes for 1 hour.", category_id: other.id)

Workout.create(name: "MONDAY", description: "Upper body day, approximately 30 mins. Repeat all exercises for 3 sets, with 8 reps per set.")
Workout.create(name: "WEDNESDAY", description: "Lower body day, approximately 45 mins. Repeat all exercises for 3 sets until failure.")
Workout.create(name: "FRIDAY", description: "Cardio day, approximately 1 hour. Run on treadmill beginning at 4 speed, increaing speed .5 every 10 minutes.")

puts "✅ Done seeding!"
