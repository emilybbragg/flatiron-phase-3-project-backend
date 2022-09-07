class Exercise < ActiveRecord::Base
    belongs_to :category
    has_many :workouts, through: :exercise_workouts
end