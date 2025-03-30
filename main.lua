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

function Main()
  local result, table = turtle.inspectDown()
  if result then
    print("Name: ", table.name)
  end
  turtle.select(2)
  equipped = turtle.getItemDetail()
  if equipped ~= nil then
    print("Currently holding: ", equipped.name)
  end
end

Main()