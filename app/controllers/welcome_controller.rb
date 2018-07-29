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

    for x in 0..@loop
      if (x % (@loop / 5)) == 0
        @temperatura.push(@temp['list'][x]['main']['temp'])
        @dia.push(@temp['list'][x]['dt_txt'].split[0].split('-').reverse)
        @clima.push(@temp['list'][x]['weather'][0]['description'].capitalize!)
      end
    end
  end

  def create
    @user = User.new(params[:user])

    @user.save
    redirect_to @user
  end

  def delete
  end
end
