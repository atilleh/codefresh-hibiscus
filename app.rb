require "json"
require "sinatra"
require "./lib/codefresh"

set :apikey, ENV["CF_TOKEN"]
set :public_folder, __dir__ + '/static'

get '/' do
    @cf = Cf.new(settings.apikey)
    @projects = @cf.projects

    erb :index, layout: :template
end

get '/projects/:id' do
    @cf = Cf.new(settings.apikey)
    @project = @cf.project(params["id"])
    @pipelines = @cf.pipelines(params["id"])["docs"]

    erb :project, layout: :template
end

get '/pipelines/:id' do
    @cf = Cf.new(settings.apikey)
    @pipeline, @builds = @cf.pipeline(params["id"])

    erb :pipeline, layout: :template
end

get '/status' do
    content_type :"application/json"
    { code: 200 }.to_json
end