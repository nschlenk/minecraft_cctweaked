
input = peripheral.find("minecraft:chest")
while true do
  item = input.getItemDetail(1)
  peripheral.call("top", "write", item.name)
end
