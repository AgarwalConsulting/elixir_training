defmodule ExampleParser do
  @spec parse_path(Path.t(), [module()]) :: {:ok, term} | {:error, atom}
  def parse_path(filename, parsers) do
    with {:ok, ext} <- parse_extension(filename),
        {:ok, parser} <- find_parser(ext, parsers),
        {:ok, contents} <- File.read(filename) do
      parser.parse(contents)
    end
  end

  defp parse_extension(filename) do
    if ext = Path.extname(filename) do
      {:ok, ext}
    else
      {:error, :no_extension}
    end
  end

  defp find_parser(ext, parsers) do
    if parser = Enum.find(parsers, fn parser -> ext in parser.extensions() end) do
      {:ok, parser}
    else
      {:error, :no_matching_parser}
    end
  end
end
