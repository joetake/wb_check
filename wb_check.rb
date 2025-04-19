require 'pathname'
require 'tree_sitter'
require 'benchmark'
require 'objspace'
require_relative 'lib/analyzer'


# main

# mesure time and memory of whole program
# run gc in advance
GC.start

# get parser and source
path_to_source = ARGV[0].to_s
path_to_parser = './bin/libtree-sitter-c.so'

if path_to_source.nil?
  puts "can't find source code"
  return
end

if path_to_parser.nil?
  puts "can't find parser"
  return
end

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
