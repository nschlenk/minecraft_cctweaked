
input = peripheral.find("minecraft:chest")
local m = peripheral.wrap("top")
v = 1
while true do
  item = input.getItemDetail(1)
  if item ~= nil and item ~= v then
    m.clear()
    m.setCursorPos(1, 1)
    n = item.name
    m.write(n)
    v = item
  elseif item == nil then
    m.clear()
    m.setCursosPos(1, 1)
    m.write("None")
  end
end
