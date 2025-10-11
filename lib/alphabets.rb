class Alphabets
  attr_accessor :alphabets

  def initialize
    @alphabets = Array.new(26)
  end

  def alphabets_info
    alphabets[0] = 'Q'
    alphabets[1] = 'W'
    alphabets[2] = 'E'
    alphabets[3] = 'R'
    alphabets[4] = 'T'
    alphabets[5] = 'Y'
    alphabets[6] = 'U'
    alphabets[7] = 'I'
    alphabets[8] = 'O'
    alphabets[9] = 'P'
    alphabets[10] = 'A'
    alphabets[11] = 'S'
    alphabets[12] = 'D'
    alphabets[13] = 'F'
    alphabets[14] = 'G'
    alphabets[15] = 'H'
    alphabets[16] = 'J'
    alphabets[17] = 'K'
    alphabets[18] = 'L'
    alphabets[19] = 'Z'
    alphabets[20] = 'X'
    alphabets[21] = 'C'
    alphabets[22] = 'V'
    alphabets[23] = 'B'
    alphabets[24] = 'N'
    alphabets[25] = 'M'
  end

  def display_alphabet
    "
    #{alphabets[0]} #{alphabets[1]} #{alphabets[2]} #{alphabets[3]} #{alphabets[4]} #{alphabets[5]} #{alphabets[6]} #{alphabets[7]} #{alphabets[8]} #{alphabets[9]}
    #{alphabets[10]} #{alphabets[11]} #{alphabets[22]} #{alphabets[13]} #{alphabets[14]} #{alphabets[15]} #{alphabets[16]} #{alphabets[17]} #{alphabets[18]}
    #{alphabets[19]} #{alphabets[20]} #{alphabets[21]} #{alphabets[22]} #{alphabets[23]} #{alphabets[24]} #{alphabets[25]}
    "
  end

  def remove_alphabet(alphabet)
    @alphabets.delete(alphabet)
  end
end
