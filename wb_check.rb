require 'pathname'
require 'tree_sitter'
require 'benchmark'
require 'objspace'
require_relative 'lib/analyzer'


# main

# mesure time and memory of whole program
# run gc in advance
GC.start

# get path for parser from environmental variables
path_to_source = ENV['OBJECT']
path_to_parser = ENV['PATH_TO_C99PARSER']

# start measuring
before = ObjectSpace.memsize_of_all
total_time = Benchmark.realtime do
  analyzer = Analyzer.new(path_to_source, path_to_parser)
  analyzer.run
end
after = ObjectSpace.memsize_of_all

puts "Total processing time: #{total_time} seconds"
puts "Memory used before: #{before / 1024} KB"
puts "Memory used after : #{after / 1024} KB"
puts "Memory used diff  : #{(after - before) / 1024} KB"
