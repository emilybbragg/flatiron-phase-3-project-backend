class Exercise < ActiveRecord::Base
    belongs_to :category
    belongs_to :exercise_workout
end