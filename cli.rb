require './2markovchains.rb'

if (ARGV[0] == 'get') then
	rapGeniusToCorpus(ARGV[1])
elsif (ARGV[0] == 'load') then
	textFileToCorpus(ARGV[1], ARGV[2])
else
	puts markov(ARGV[0])
end
