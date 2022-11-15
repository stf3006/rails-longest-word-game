require "open-uri"
require "json"

class GamesController < ApplicationController

  def new #display new random grid and a form & the form is submitted with POST
    @letters = []
    10.times do @letters << Array("a".."z").sample
    @letters
  end
end

  def score
    raise
    user_input = params[:user_input]
    @boolean = search_word(user_input)

  end

  def search_word(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}").read
    json = JSON.parse(response)
    return json["found"]
  end
end
