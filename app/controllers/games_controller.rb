require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @answer = params[:phrase]
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    word_serialized = URI.open(url).read
    word_exists = JSON.parse(word_serialized)['found']
    if @answer == word_exists && @answer.count <= 10
      return "Congratulations ! #{@answer} is a valid English word"
    elsif @answer == word_exists
      return
    end
    # if @answer.count < 10 &&

    # end
  end
end
