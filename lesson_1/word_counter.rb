def string_lengths(sentence)
    words = sentence.split
    word_lengths = []
    counter = 0
  
    while counter < words.size do
      word_lengths << words[counter].length
      counter += 1
    end
  
    word_lengths
  end

  hamlet = 'to be or not to be'

  p string_lengths(hamlet)