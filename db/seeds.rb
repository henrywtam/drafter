# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require_relative 'KTK.json'
require 'json'
require 'pp'

seedPath = "#{Rails.root}/db/KTK.json"
setData = JSON.parse(File.read(seedPath))

St.create(
  name:         setData["name"],
  code:         setData["code"],
  releaseDate:  setData["releaseDate"],
  block:        setData["block"]
  )

card_counter = 0
# setData["cards"].count.times do
5.times do
  Card.create(
    st_id: 1,
    card_type:    setData["cards"][card_counter]["type"],
    card_types:   setData["cards"][card_counter]["types"],
    colors:       setData["cards"][card_counter]["colors"],
    multiverseid: setData["cards"][card_counter]["multiverseid"],
    name:         setData["cards"][card_counter]["name"],
    subtypes:     setData["cards"][card_counter]["subtypes"],
    rarity:       setData["cards"][card_counter]["rarity"],
    power:        setData["cards"][card_counter]["power"],
    toughness:    setData["cards"][card_counter]["toughness"],
    manaCost:     setData["cards"][card_counter]["manaCost"],
    imageName:    setData["cards"][card_counter]["imageName"]
    )
  card_counter += 1
end