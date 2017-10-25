require_relative 'binary_search_tree'

# input
# get the input
@input = gets.strip.split(",").map { |el| el.to_i unless el == "null" }
@val = gets.to_i

# built the BST
@tree = BinarySearchTree.new

@input.each do |val|
  @tree.insert(val) if val
end

# output