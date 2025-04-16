
input = peripheral.find("minecraft:chest")
monitor = peripheral.find("monitor")
while true do
  item = input.getItemDetail(1)
  if item ~= nil do
    monitor.clear()
    monitor.write(item.name)
    print(item.name)
  end
end
