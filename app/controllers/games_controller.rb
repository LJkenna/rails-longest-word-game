require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    array_const = ('A'..'Z').to_a - %w[A E I U O] + ('A'..'Z').to_a - %w[A E I U O]
    array_vowel = %w[A E I U O]
    @letters = array_const.sample(7) + array_vowel.sample(3)
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
    @message = if @answer.upcase!.chars.all? { |letter| @answer.count(letter) <= @grid.count(letter) }
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
