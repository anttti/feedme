# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Feedme.Repo.insert!(%Feedme.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Read inserts.sql into a variable
sql = File.read!("priv/repo/inserts.sql")

# Insert the contents of inserts.sql into the database one line at a time
Enum.each(String.split(sql, "\n"), fn line ->
  if String.length(line) > 0 do
    case Feedme.Repo.query(line) do
      {:ok, _} -> IO.puts("Inserted: #{line}")
      {:error, _} -> IO.puts("Failed to insert: #{line}")
    end
  end
end)
