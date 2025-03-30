-- Noelle is trying her best
-- ~= means not equal unless it's boolean, then it's "not"
-- boolean values are all lowercase
-- variables are global by default
-- nil instead of null

local origin = {
  cd = 0, -- east (0), west (2), north (1), south (3)
  x = 1,
  z = 1,
}

local loc = {
  cd = 0,
  x = 1,
  z = 1,
}

function Hoe()
  local n = 0
  while n < 16 do
    local info = turtle.getItemDetail()
    x = turtle.getSelectedSlot()
    if info ~= nil and info.name == "minecraft:iron_hoe" then
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

function WorkBlock()
  local result, table = turtle.inspectDown()
  if table.name == "minecraft:grass_block" or table.name == "minecraft:dirt" then
    -- hoe
  end
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
  local hoe_present = Hoe()
  while hoe_present do
    hoe_present = Hoe()
    if loc.z == 1 or loc.z == 3 or loc.z == 5 then
      while loc.x < 5 do
        WorkBlock()
        TurnTo(0)
        loc.cd = 0
        turtle.forward()
        loc.x = loc.x + 1
      end
      if loc.z == 1 or loc.z == 3 then
        TurnTo(1)
        loc.cd = 1
        turtle.forward()
        loc.z = loc.z + 1
      end
    end
    if loc.z == 2 or loc.z == 4 then
      while loc.x > 1 do
        TurnTo(2)
        loc.cd = 2
        turtle.forward()
        loc.x = loc.x - 1
      end
      TurnTo(1)
      loc.cd = 1
      turtle.forward()
      loc.z = loc.z + 1
    end
    if loc.x == 5 and loc.z == 5 then
      GoHome()
    end
  end
end



turtle.select(1)
Main()