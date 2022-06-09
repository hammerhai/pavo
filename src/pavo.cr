require "bit_array"

# A textual algorithm that checks for similarities in any given word.
module Pavo
  extend self

  VERSION = "0.1.0"

  class BlankStringException < Exception
  end

  class NilByteIndexException < Exception
  end

  class NonAsciiStringException < Exception
  end

  # Calculate the similarity of two strings.
  def similarity(precursor : String, symbol : String) : Float64?
    precursor_bytes_size = precursor.bytesize
    symbol_bytes_size = symbol.bytesize
    total_bytes_size = if precursor_bytes_size >= symbol_bytes_size
                         precursor_bytes_size
                       else
                         symbol_bytes_size
                       end

    # Compare if both strings are blank, then raise a `BlankStringException`
    # if so.
    if precursor.blank? && symbol.blank?
      raise BlankStringException.new("Neither string can be blank")
    end

    # Since the ASCII table is made up of mostly Latin characters, check
    # if the strings are alike in their sense of language before attempting
    # to compare their similarity on a larger scale.
    if precursor.ascii_only? && symbol.ascii_only?
      bit_array = BitArray.new(total_bytes_size)
      byte_offset = 0

      # Loop through the bytes of `precursor`.
      precursor.each_byte do |byte|
        # Get the index of `byte` in `precursor`.
        byte_index = precursor.byte_index(byte, byte_offset)

        # Increment `byte_offset` after each iteration.
        byte_offset += 1

        # Ensure the `byte_index` is not nil, then continue as normal.
        if byte_index
          # Get the byte at `byte_index` in `symbol`.
          symbol_byte_at = symbol.byte_at?(byte_index)

          # Toggle the `byte_index` in `bit_array` only if both bytes from
          # each string are equal.
          if byte == symbol_byte_at
            bit_array.toggle(byte_index)
          end
        else
          # `byte_index` may never be nil, however should it be,
          # then raise `NilByteIndexException`.
          raise NilByteIndexException.new("Byte index is nil")
        end
      end

      # Return the similiary score.
      bit_array.count(true) / total_bytes_size
    else
      # Raise `NonAsciiStringException` should either string contain non-ascii
      # characters.
      raise NonAsciiStringException.new("Strings must only contain ASCII")
    end
  end
end
