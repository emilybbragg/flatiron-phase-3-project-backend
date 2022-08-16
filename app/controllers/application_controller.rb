class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/exercises' do
    exercises = Exercise.all
    exercises.to_json
  end

  get '/workouts' do
    workouts = Workouts.all
    workouts.to_json
  end

end
