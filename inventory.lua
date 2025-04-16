
input = peripheral.find("minecraft:chest")
monitor = peripheral.find("monitor")
while true do
  item = input.getItemDetail(1)
  monitor.clear()
  monitor.write(item.name)
end
