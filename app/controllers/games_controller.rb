require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    array = ('a'..'z').to_a + ('a'..'z').to_a
    @letters = array.sample(10)
  end

  def hash_feedback(attempt)
    url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
    answer = URI.open(url).read
    JSON.parse(answer)
  end

  def score
    @answer = params[:answer]
    @grid =   params[:letters]
    @hash_feedback = hash_feedback(@answer)
    @message = if @answer.chars.all? { |letter| @answer.count(letter) <= @grid.count(letter) }
                 @message = if @hash_feedback['found']
                              'Well done'
                            else
                              "That's not an English word"
                            end
               else
                 "That's not in the grid"
               end
  end
end
