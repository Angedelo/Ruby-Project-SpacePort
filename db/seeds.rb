require_relative( "../models/ship.rb" )
require_relative( "../models/owner.rb" )
require("pry-byebug")

Ship.delete_all()
Owner.delete_all()

owner1 = Owner.new({
  "name" => "Han Solo",
  "wanted_level" => "medium"
})

owner1.save()

owner2 = Owner.new({
  "name" => "Dash Rendar",
  "wanted_level" => "low"
})

owner2.save()

owner3 = Owner.new({
  "name" => "Boba Fett",
  "wanted_level" => "high"
})

owner3.save()

owner4 = Owner.new({
  "name" => "Hera Syndulla",
  "wanted_level" => "low"
})

owner4.save()

ship1 = Ship.new({
  "name" => "Millenium Falcon",
  "type" => "YT1300",
  "size" => 10,
  "owner_id" => owner1.id
})

ship1.save()

ship2 = Ship.new({
  "name" => "Slave 1",
  "type" => "Firespray",
  "size" => 6,
  "owner_id" => owner3.id
})

ship2.save()

ship3 = Ship.new({
  "name" => "Outrider",
  "type" => "YT2400",
  "size" => 8,
  "owner_id" => owner2.id
})

ship3.save()

ship4 = Ship.new({
  "name" => "Ghost",
  "type" => "VCX-100",
  "size" => 18,
  "owner_id" => owner4.id
})

ship4.save()

binding.pry
nil
