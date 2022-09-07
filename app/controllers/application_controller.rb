# controller for all CRUD requests

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # GET request for retrieving all exercises
  get '/exercises' do
    exercises = Exercise.all
    exercises.to_json
  end

  # GET request for retrieving all workouts
  get '/workouts' do
    workouts = Workout.all
    workouts.to_json
  end

  # GET request for retrieving all categories
  get '/categories' do
    categories = Category.all
    categories.to_json
  end

  # GET request for retrieving all exercises for each workout
  get '/exercise-workouts' do
    exerciseWorkouts = ExerciseWorkout.all
    exerciseWorkouts.to_json
  end

  # DELETE request for deleting an exercise
  delete '/exercises/:id' do
    exercise = Exercise.find(params[:id])
    exercise.destroy
    exercise.to_json
  end

  # DELETE request for deleting a workout
  delete '/workouts/:id' do
    workout = Workout.find(params[:id])
    workout.destroy
    workout.to_json
  end

  # POST request for creating an exercise
  # each exercise has a name, description and a category id
  post '/exercises' do
    exercise = Exercise.create(
      name: params[:name],
      description: params[:description],
      category_id: params[:category_id],
    )
    exercise.to_json
  end

  # POST request for creating a workout
  post '/workouts' do
    workout = Workout.create(
      name: params[:name],
      description: params[:description],
    )
    workout.to_json
  end

  # PATCH request for updating a workout
  # create new array consisting of all exercises for each workout
  # for each exercise, take in arg of exercise id
  # create variable for each new exercise for workout, consisting of an exercise id and workout id
  # find exercise based on id
  # add matching exercise to array of all exercises
  # display all exercises for each workout
  patch '/workouts/:id' do

    ExerciseWorkout.where(workout_id: params[:id]).destroy_all

    exercise_workouts = []

    params[:exercises].each do |exercise_id|
    
      exercise_workout = ExerciseWorkout.create(
        exercise_id: exercise_id,
        workout_id: params[:id],
      )

      exercise = Exercise.find(exercise_id)
      exercise_workouts.push(exercise)
      end
    exercise_workouts.to_json
    end
  end