
input = peripheral.find("minecraft:chest")
monitor = peripheral.find("monitor")
while true do
  item = input.getItemDetail(1)
  if item ~= nil then
    monitor.clear()
    monitor.write(item.name)
    print(item.name)
  end
end
