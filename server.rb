require 'sinatra'
require './2markovchains.rb'

get '/favicon.ico' do
	return ''
end

get '/:names' do |n|
	markov(n)
end