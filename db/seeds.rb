puts "🌱 Seeding spices..."

Exercise.create(name: "Seated military press", description: "Press bar upward until arms are extended overhead. Return to upper chest and repeat.", category: "Other")
Exercise.create(name: "Hip adductor", description: "Move leg toward and across supporting leg Return and repeat. Reposition roller pad lever and continue with opposite leg.", category: "Legs")
Exercise.create(name: "Hip thrust", description: "Raise bar upward by extending hips until straight. Lower and repeat.", category: "Glutes")

Workout.create(name: "Monday", description: "Gym workout, approximately 30 mins")
Workout.create(name: "Monday", description: "Gym workout, approximately 1 hour")
Workout.create(name: "Monday", description: "At-home workout, approximately 20 minutes")

puts "✅ Done seeding!"
