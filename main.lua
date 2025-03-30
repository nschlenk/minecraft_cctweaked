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
  info = turtle.getItemDetail()
  n = 0
  while n < 16 do
    info = turtle.getItemDetail()
    if info.name == "minecraft:iron_hoe" then
      return true
    elseif info.name ~= "minecraft:iron_hoe" then
      n = n + 1
      x = turtle.getSelectedSlot()
      if x == 16 then
        new_x = 1
      elseif x ~= 16 then
        new_x = x + 1
      end
    end
    turtle.select(new_x)
  end
  return false
end


function Main()
  local result, table = turtle.inspectDown()
  hoe_present = Hoe()
  if hoe_present == true then
    print(table.name)
  end
  --if table.name == "minecraft:dirt" or table.name == "minecraft:grass_block" then
  --end
end

Main()