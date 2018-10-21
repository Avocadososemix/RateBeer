json.extract! brewery, :id, :name, :year
json.beers do
  json.name brewery.beers
end
json.active do
  json.name brewery.active
end