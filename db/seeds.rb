require_relative( "../models/ship.rb" )
require_relative( "../models/owner.rb" )
require("pry-byebug")

Ship.delete_all()
Owner.delete_all()

ship1 = Ship.new({
  "name" => "Millenium Falcon",
  "type" => "YT1300",
  "size" => 10
})

ship1.save()

ship2 = Ship.new({
  "name" => "Slave 1",
  "type" => "Firespray",
  "size" => 6
})

ship2.save()

ship3 = Ship.new({
  "name" => "Outrider",
  "type" => "YT2400",
  "size" => 8
})

ship3.save()

ship4 = Ship.new({
  "name" => "Ghost",
  "type" => "VCX-100",
  "size" => 18
})

ship4.save()

owner1 = Owner.new({
  "name" => "Han Solo",
  "wanted_level" => "medium",
  "ship_id" => ship1.id
})

owner1.save()

owner2 = Owner.new({
  "name" => "Dash Rendar",
  "wanted_level" => "low",
  "ship_id" => ship3.id
})

owner2.save()

owner3 = Owner.new({
  "name" => "Boba Fett",
  "wanted_level" => "high",
  "ship_id" => ship2.id
})

owner3.save()

owner4 = Owner.new({
  "name" => "Hera Syndulla",
  "wanted_level" => "low",
  "ship_id" => ship4.id
})

owner4.save()

binding.pry
nil
