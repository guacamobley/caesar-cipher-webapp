CAPITAL_A = 65
CAPITAL_Z = 90
LOWERCASE_A = 97
LOWERCASE_Z = 122

def normalize_shift shift

  if shift > 0
    shift %= 26
  else
    shift *= -1
    shift %= 26
    shift *= -1
  end
  return shift
end

def shift_letter (code,shift)

  if code >= CAPITAL_A && code <= CAPITAL_Z
    new_code = code + shift
    if new_code > CAPITAL_Z
      new_code -= 26
    elsif new_code < CAPITAL_A
      new_code += 26
    end
  elsif code >= LOWERCASE_A && code <= LOWERCASE_Z
    new_code = code + shift
    if new_code > LOWERCASE_Z
      new_code -= 26
    elsif new_code < LOWERCASE_A
      new_code +=26
    end
  else
    new_code = code
  end
  return new_code.chr
end

def caesar_cipher (input,shift)
  return input if shift == 0

  normalized_shift =normalize_shift shift
  output_array = input.bytes.map do |c| shift_letter c, normalized_shift end
  return output_array.join ""
end