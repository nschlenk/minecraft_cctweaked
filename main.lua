-- Noelle is trying her best
-- ~= means not equal unless it's boolean, then it's "not"
-- boolean values are all lowercase
-- variables are global by default
-- nil instead of null

origin = {
  cd = 'e',
  x = 1,
  y = 1,
  z = 1,
}

loc = {
  cd = 'e',
  x = 1,
  y = 1,
  z = 1,
}

function Hoe()
  n = 0
  while n < 16 do
    info = turtle.getItemDetail()
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
  print("Getting hoe")
end


function Main()
  local result, table = turtle.inspectDown()
  hoe_present = Hoe()
  if hoe_present == true then
    print(table.name)
  elseif hoe_present == false then
    GetHoe()
  end
  --if table.name == "minecraft:dirt" or table.name == "minecraft:grass_block" then
  --end
end


turtle.select(1)
Main()