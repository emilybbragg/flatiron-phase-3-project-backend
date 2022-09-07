class Workout < ActiveRecord::Base
    has_many :exercises, through: :exercise_workout
end