# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     KycApi.Repo.insert!(%KycApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias KycApi.Accounts

Accounts.create_user(%{
  email: "user4@business.com",
  password: "password2",
  full_name: "nitin1",
  age: 25,
  interest: [
    %{
      topic: "Car",
      description: "Riding car"
    },
    %{
      topic: "Technology",
      description: "Updated Tech Geek"
    },
    %{
      topic: "Bike",
      description: "Bike Rides"
    },
    %{
      topic: "Music",
      description: "Listending To Music"
    },
    %{
      topic: "Movies",
      description: "Watching Movies"
    },
    %{
      topic: "News",
      description: "Getting updated with currect Affairs"
    },
    %{
      topic: "Reels",
      description: "Watching Reels"
    },
    %{
      topic: "ShortMovie",
      description: "Making Short movies"
    },
    %{
      topic: "Photography",
      description: "Clicking pictures"
    },
    %{
      topic: "Foodie",
      description: "Trying new variety of Food"
    }
  ]
})

Accounts.create_user(%{
  email: "user1@business.com",
  password: "password1",
  full_name: "nitin",
  age: 25,
  interest: [
    %{
      topic: "Make Up",
      description: "Trying out new looks"
    },
    %{
      topic: "Hair style",
      description: "Trying out new looks"
    },
    %{
      topic: "Cooking",
      description: "Cooking"
    },
    %{
      topic: "Guitar",
      description: "Playing guitar"
    },
    %{
      topic: "Animal",
      description: "Animal lover"
    },
    %{
      topic: "Mobile",
      description: "Getting updates on mobile"
    },
    %{
      topic: "Cycling",
      description: "Riding Bicycle"
    },
    %{
      topic: "Travel",
      description: "Visiting places"
    },
    %{
      topic: "Painting",
      description: "Painting"
    },
    %{
      topic: "Watch",
      description: "Clloecting watches"
    }
  ]
})
