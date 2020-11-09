require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('a'..'z').to_a.sample }
  end

  def score
    @my_word = params[:word]
    @letters = params[:letters].split

    url = "https://wagon-dictionary.herokuapp.com/#{@my_word}"
    word_serialized = open(url).read
    word = JSON.parse(word_serialized)

    @my_word.chars.each do |my_w|
      if @letters.include?(my_w) == true && word['found'] == true
        @answer = 'Good'
      else
        @answer = 'Bad'
      end
    end
  end
end
