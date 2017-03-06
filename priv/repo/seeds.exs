# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Elmnix.Repo.insert!(%Elmnix.Contact{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Elmnix.Seeds do
  def random_number(from, to) do
    value = from..to
      |> Enum.take_random(1)
      |> Enum.at(0)

    if value < 10 do
      "0#{value}"
    else
      to_string(value)
    end
  end
end

alias Elmnix.{Repo, Contact, Seeds}

IO.puts "---- Deleteing existing contacts"

Repo.delete_all Contact

IO.puts "---- Creating people"

for index <- 1..100 do
  first_name = Faker.Name.first_name
  {gender_id, gender_name} = Enum.random Contact.genders
  gender_name = to_string(gender_name)
  picture_gender = case gender_name do
    "male" -> "men"
    _ -> "women"
  end

  params = %{
    first_name: first_name,
    last_name: Faker.Name.last_name,
    gender: gender_id,
    birth_date: "#{Seeds.random_number(1970, 1990)}-#{Seeds.random_number(1, 12)}-#{Seeds.random_number(1,28)}",
    location: Faker.Address.country(),
    phone_number: Faker.Phone.EnUs.phone,
    email: Faker.Internet.email(first_name),
    picture: "http://api.randomuser.me/portraits/#{picture_gender}/#{index}.jpg",
    headline: Faker.Lorem.sentence(3),
  }

  {:ok, contact} = %Contact{}
  |> Contact.changeset(params)
  |> Repo.insert

  IO.puts "---- Inserted contact #{contact.id}"
end

# add manually
# contact = %Elmnix.Contact{first_name: "Grim", last_name: "Reaper", gender: 1, birth_date "29 February 1980", location: "Volta, Mars", phone_number: "80800808", email: "grimreaper@killyah.dead", picture: "http://rs141.pbsrc.com/albums/r73/salem21_2006/achmed.jpg~c200", headline "I Keel Yu"}
# Elmnix.Repo.insert contact
