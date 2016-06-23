defmodule Caesar do
  def main(argv) do
    argv
      |> parse_args
      |> process
    System.halt(0)
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean])
    case parse do
      {[help: true], _________ , _} -> {:help}
      {[shift: shift], ["encrypt", msg], _} ->{:encrypt, msg, shift |> String.to_integer}
      ______ -> {:help}
    end
  end

  def process( {:encrypt, msg, shift} )do
    Caesar.cipher.encrypt(msg, shift)
      |> IO.puts
  end

  def process({:help}) do
    IO.puts
  end
end
