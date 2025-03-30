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
  local table = turtle.inspectDown()
  for val in table do
    print(val)
  end
end

Main()