# original

require_relative '../date_core.so'
GC::Profiler.enable

count = 10_000_000
date = Date.new(2025, 2, 4)
copy = nil

arr = Array.new(count)
arr << date
copy = date.new_start(Date::ITALY)
(0...count).each do
  copy = copy.new_start(Date::ITALY)
  arr << copy
end

puts "total_time: #{GC::Profiler.total_time.round(4).to_s}ms"
