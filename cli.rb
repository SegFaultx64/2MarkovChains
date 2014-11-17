require './2markovchains.rb'

if (ARGV[0] == 'get') then
	rapGeniusToCorpus(ARGV[1])
else
	puts markov(ARGV[0])
end
