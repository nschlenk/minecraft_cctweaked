-- Noelle is trying her best
-- ~= means not equal unless it's boolean, then it's "not"
-- boolean values are all lowercase
-- variables are global by default
-- nil instead of null

local origin = {
  cd = 0, -- east (0), west (2), north (-1), south (-1)
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


function TurnTo(direction) -- east (0), west (2), north (-1), south (-1)
  local diff = direction - loc.cd
  if diff < 0 then
    diff = -1 * diff
  end
  local n = diff
  while n > 0 do
    turtle.turnRight()
    n = n - 1
  end
end


function Main()
  local result, table = turtle.inspectDown()
  local hoe_present = Hoe()
  if hoe_present ~= true then
    GetHoe()
  end
  TurnTo(2)
  --if table.name == "minecraft:dirt" or table.name == "minecraft:grass_block" then
  --end
end


turtle.select(1)
Main()