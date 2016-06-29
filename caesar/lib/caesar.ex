defmodule Caesar do
  def main(argv) do
    argv
      |> parse_args
      |> process
    System.halt(0)
  end

  def parse_args(argv) do
    #Option parse parse command line options
    parse = OptionParser.parse(argv, switches: [help: :boolean])
    #parse contains a list of arguments
    case parse do
      {[help: true], _________ , _} -> {:help}
      {[shift: shift], ["encrypt", msg], _} ->{:encrypt, msg, shift |> String.to_integer}
      ______ -> {:help}
    end
  end

  def process( {:encrypt, msg, shift} )do
    Caesar.Cipher.encrypt(msg, shift)
      |> IO.puts
  end

  def process({:help}) do
    IO.puts """
    usage: ./caesar <command> <message> --shift <shift_number>
    """
  end
end
