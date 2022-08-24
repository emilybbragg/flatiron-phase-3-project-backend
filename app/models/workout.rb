class Workout < ActiveRecord::Base
    has_many :exercises
    has_many :exercise_workout
end