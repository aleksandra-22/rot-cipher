class Cipher
  LOW_ALPHABET = ("a".ord.."z".ord)
  HIGH_ALPHABET = ("A".ord.."Z".ord)
  ALPHABET_LENGTH = 26

  def initialize(key)
    @key = key
  end

  def encrypt(encrypted_message)
    array = encrypted_message.each_char.map do |character|
      if character =~ /[A-Za-z]/
        cipher_character(character)
      else
        character
      end
    end
    array.join
  end

  def cipher_character(character)
    rot_character = character.ord
    if HIGH_ALPHABET.include?(rot_character)
      rot_character += @key
      rot_character -= ALPHABET_LENGTH if rot_character > "Z".ord
    elsif LOW_ALPHABET.include?(rot_character)
      rot_character += @key
      rot_character -= ALPHABET_LENGTH if rot_character > "z".ord
    end
    rot_character.chr
  end
end
