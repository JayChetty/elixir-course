defmodule Caesar.Cipher do
  def encrypt(msg, shift) do
    msg
      |> to_char_list
      |> Enum.map(&shift_char(&1, shift))
      |> List.to_string
    #conver to char list
    #iterate overlist and shift
    #return list as binary string
  end

  defp shift_char(char,shift) do
    case char do
      chr when chr in(?a..?z) calculate_mapping(?a, chr, shift)
      chr -> chr
    end
  end

  def calculate_mapping(base_letter, char, shift) do
    
  end
end
