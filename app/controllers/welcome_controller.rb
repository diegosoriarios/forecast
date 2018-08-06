class WelcomeController < ApplicationController
  before_action :authenticate_user!

  require 'httparty'

  def index
    @url = 'https://api.openweathermap.org/data/2.5/forecast?q=' + current_user.city + ',' + current_user.country_cod + '&lang=pt&units=metric&mode=json&appid=5325907441644570670df6cdec3acd5a'
    @temp = HTTParty.get(@url)
    @cidade = @temp['city']['name']

    @temperatura = []
    @dia = []
    @clima = []
    @loop = @temp['list'].length
    @array = (@loop.to_i / 5).ceil
    for x in 0..@loop
      if (x % @array-1) == 0
        @temperatura.push(@temp['list'][x]['main']['temp'])
        @dia.push(@temp['list'][x]['dt_txt'].split[0].split('-').reverse)
        @clima.push(@temp['list'][x]['weather'][0]['description'].capitalize!)
      end
    end

    puts "---------------------------------------"
    @city = City.find_or_create_by(name: current_user.city)
    @city.save
    puts "---------------------------------------"

    puts "---------------------------------------"
    @country = Country.find_or_create_by(name: current_user.country, code: current_user.country_cod)
    @country.save
    puts "---------------------------------------"

  end

  def delete
  end
end
