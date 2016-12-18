require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
  get '/' do
    erb :root
  end

  get '/new' do
    erb (:'pirates/new')
  end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate][:name],params[:pirate][:weight],params[:pirate][:height])
      @ships = Ship.all
      params[:pirate][:ships].each {|ship| Ship.new(name: ship[:name], type: ship[:type], booty: ship[:booty])}
      erb (:'pirates/show')
    end

  end
end
