require "json"
require "open-uri"
class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    base_url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    read = URI.open(base_url).read
    review = JSON.parse(read)
    @answer = review["found"] ? "its a word" : "it's not a word"
  end

end
