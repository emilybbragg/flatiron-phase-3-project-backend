class Workout < ActiveRecord::Base
    has_many :exercises
    belongs_to :exercise_workout
end