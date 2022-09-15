class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/exercises' do
    exercises = Exercise.all
    exercises.to_json
  end

  get '/workouts' do
    workouts = Workout.all
    workouts.to_json(include: { exercise_workouts: { include: :exercise } })
  end

  get '/workouts/:id' do
    workout = Workout.find(params[:id])
    workout.to_json(include: { exercise_workouts: { include: :exercise } })
  end

  get '/categories' do
    categories = Category.all
    categories.to_json
  end

  get '/categories/:id' do
    categories = Category.all
    categories.to_json(include: :exercises )
    # add exercise in json statement
  end

  get '/exercise-workouts' do
    exerciseWorkouts = ExerciseWorkout.all
    exerciseWorkouts.to_json
  end

  delete '/exercises/:id' do
    exercise = Exercise.find(params[:id])
    exercise.destroy
    exercise.to_json
  end

  delete '/workouts/:id' do
    workout = Workout.find(params[:id])
    workout.destroy
    workout.to_json
  end

  post '/exercises' do
    exercise = Exercise.create(
      name: params[:name],
      description: params[:description],
      category_id: params[:category_id],
    )
    exercise.to_json
  end

  post '/workouts' do
    workout = Workout.create(
      name: params[:name],
      description: params[:description],
    )
    workout.to_json
  end

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