require 'marky_markov'
require 'pry'

class FakeParagraph

  def initialize
    @markov = MarkyMarkov::TemporaryDictionary.new
    @markov.parse_file("sample.txt")
  end

  def self.hello
    puts "Hello world"
  end

  def simple_text(word_count)
    @markov.generate_n_words(word_count)
  end


  def generate_n_words_by_n_sentences(word_count, sentence_count)
    if !(word_count >= sentence_count)
      puts "Word count must be greater than or equal to sentence count"
    else
      sentence_array = []
      avg_wrds_per_sent = word_count/sentence_count
      words_array = simple_text(word_count).gsub(/[.?!]/, '').split(" ")
      byebug
      generate_n_random_sets(sentence_count, words_array)

      words.join(" ")
    end
  end


  def generate_n_random_sets(set_count, array)
    array_copy = array[0..array.length]
    final_sets = []

    while array_copy.any?
      upper_thresold = array.length/set_count

      final_sets.push(array_copy.slice!(0,upper_thresold))
    end

    final_sets
  end


end

pry.start
