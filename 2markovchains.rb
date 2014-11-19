require 'rapgenius'
require 'marky_markov'

def markov(n)
	names = n.split('+')
	if names.length > 1 then
		markov = MarkyMarkov::Dictionary.new('./dictionaries/'+n.gsub(/\s/, ''), 2) # Saves/opens dictionary.mmd
		c = names.reduce(''){ |corpus, name| corpus + File.read('./dictionaries/'+ name.gsub(/\s/, '') + '.dict') }
		markov.parse_string c
		markov.save_dictionary! # Saves the modified dictionary/creates one if it didn't exist.
		return markov.generate_n_sentences 3
	else
		markov = MarkyMarkov::Dictionary.new('./dictionaries/'+n.gsub(/\s/, ''), 2) # Saves/opens dictionary.mmd
		markov.save_dictionary! # Saves the modified dictionary/creates one if it didn't exist.
		return markov.generate_n_sentences 1
	end
end

def rapGeniusToCorpus(artistName)
	artist = RapGenius.search_by_artist(artistName)[0].artist

	corpus = ""

	for x in 1..15
		prim = artist.songs(page: x).select { |v| v.artist.name == artist.name }

		prim.each { |a| corpus += a.lines.map { |b| b.lyric }.join("\n") }

		puts x.to_s + " done"
	end

	# corpus = File.read('./' + artist + '.dict')
	File.write('./dictionaries/' + artistName.gsub(/\s/, '') + '.dict', corpus)

	markov = MarkyMarkov::Dictionary.new('./dictionaries/' + artistName.gsub(/\s/, '') { |match|  }, 2) # Saves/opens dictionary.mmd
	markov.parse_string corpus
	markov.save_dictionary! # Saves the modified dictionary/creates one if it didn't exist.

end

def textFileToCorpus(file, name)
	puts file
	corpus = File.read(file)

	File.write('./dictionaries/' + name.gsub(/\s/, '') + '.dict', corpus)
	markov = MarkyMarkov::Dictionary.new('./dictionaries/' + name.gsub(/\s/, '') { |match|  }, 2) # Saves/opens dictionary.mmd
	markov.parse_string corpus
	markov.save_dictionary! 
end