class Exercise < ActiveRecord::Base
    belongs_to :category
    has_many :exercise_workouts
end