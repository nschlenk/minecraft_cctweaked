-- Noelle is trying her best
-- ~= means not equal
-- boolean values are all lowercase
-- variables are global by default
-- nil instead of null

local origin = {
  cd = 0, -- east (0), west (2), north (1), south (3)
  x = 1,
  y = 1,
  z = 1,
}

local loc = {
  cd = 0,
  x = 1,
  y = 1,
  z = 1,
}

function HoeHand()
  local n = 0
  while n < 17 do
    local info = turtle.getItemDetail()
    x = turtle.getSelectedSlot()
    if info ~= nil and info.name == "minecraft:diamond_hoe" then
      turtle.equipLeft(x)
      return true
    end
    if n == 0 then
      turtle.equipLeft(x)
    end
    if x == 16 then
      turtle.select(1)
    else
      turtle.select(x + 1)
    end
    n = n + 1
  end
  return false
end

function SeedHand()
  local n = 0
  while n < 17 do
    local info = turtle.getItemDetail()
    x = turtle.getSelectedSlot()
    if info ~= nil and info.name == "minecraft:wheat_seeds" then
      turtle.select(x)
      return true
    end
    if x == 16 then
      turtle.select(1)
    else
      turtle.select(x + 1)
    end
    n = n + 1
  end
  return false
end


function GetHoe()
  print("Hoe please")
  --Turtle will go get a hoe
end


function TurnTo(direction) -- east (0), west (2), north (1), south (3)
  local diff = loc.cd - direction
  local n = diff
  while n > 0 do
    turtle.turnRight()
    n = n - 1
  end
  while n < 0 do
    turtle.turnLeft()
    n = n + 1
  end
end

function HoeCycle()
  hoe_in_hand = HoeHand()
  while hoe_in_hand do
    hoe_in_hand = HoeHand()
    if loc.y == 1 then
      turtle.up()
      loc.y = 2
    end
    if loc.z == 1 or loc.z == 3 or loc.z == 5 then
      while loc.x < 5 do
        turtle.digDown()
        TurnTo(0)
        loc.cd = 0
        turtle.forward()
        loc.x = loc.x + 1
      end
      turtle.digDown()
      if loc.z == 1 or loc.z == 3 then
        TurnTo(1)
        loc.cd = 1
        turtle.forward()
        loc.z = loc.z + 1
      end
    end
    if loc.z == 2 or loc.z == 4 then
      while loc.x > 1 do
        turtle.digDown()
        TurnTo(2)
        loc.cd = 2
        turtle.forward()
        loc.x = loc.x - 1
      end
      turtle.digDown()
      TurnTo(1)
      loc.cd = 1
      turtle.forward()
      loc.z = loc.z + 1
    end
    if loc.x == 5 and loc.z == 5 then
      GoHome()
      return "Hoe cycle complete"
    end
  GoHome()
  return "Hoe please!"
end
  
function PlantCycle()
  seed_in_hand = SeedHand()
  while seed_in_hand do
    seed_in_hand = SeedHand()
    turtle.placeDown()
    if loc.y == 1 then
      turtle.up()
      loc.y = 2
    end
    if loc.z == 1 or loc.z == 3 or loc.z == 5 then
      while loc.x < 5 do
        turtle.placeDown()
        TurnTo(0)
        loc.cd = 0
        turtle.forward()
        loc.x = loc.x + 1
      end
      turtle.placeDown()
      if loc.z == 1 or loc.z == 3 then
        TurnTo(1)
        loc.cd = 1
        turtle.forward()
        loc.z = loc.z + 1
      end
    end
    if loc.z == 2 or loc.z == 4 then
      while loc.x > 1 do
        turtle.placeDown()
        TurnTo(2)
        loc.cd = 2
        turtle.forward()
        loc.x = loc.x - 1
      end
      turtle.placeDown()
      TurnTo(1)
      loc.cd = 1
      turtle.forward()
      loc.z = loc.z + 1
    end
    if loc.x == 5 and loc.z == 5 then
      GoHome()
      return "Seed cycle complete"
    end
  GoHome()
  return "Seeds please!"
end
      
function GoHome()
  local move_z = loc.z
  local move_x = loc.x
  while move_z > 1 do
    TurnTo(3)
    loc.cd = 3
    turtle.forward()
    move_z = move_z - 1
  end
  while move_x > 1 do
    TurnTo(2)
    loc.cd = 2
    turtle.forward()
    move_x = move_x - 1
  end
  TurnTo(2)
  loc.cd = 2
  loc.x = 1
  loc.z = 1
end

function Main()
  n = 9
  while n < 10 do
    result = HoeCycle()
    if result == "Hoe cycle complete" then
      print(result)
      PlantCycle()
    end
  n = n - 1
  end
end



turtle.select(1)
Main()
