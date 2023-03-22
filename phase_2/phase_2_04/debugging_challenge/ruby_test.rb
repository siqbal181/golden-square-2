plaintext = "theswiftfoxjumpedoverthelazydog"
key = "secretkey"


cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)

ciphertext_chars = plaintext.chars.map do |char|
    p (cipher.find_index(char)).chr
  end

p ciphertext_chars


=begin
def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
    ciphertext_chars = plaintext.chars.map do |char|
      (65 + cipher.find_index(char)).chr
    end
    return ciphertext_chars.join
  end
  
=end

  # => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"