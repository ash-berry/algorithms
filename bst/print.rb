require_relative "input"

#print the tree
def print_tree(tree)
  nods = tree.bst_array

  b = 0
  a = 0
  el_q = 1

  while a < nods.size
    if a == 0
      puts "   #{nods[a].val }"
      el_q = 2
      a = 1
      b = 2
    else
      puts
      nods[a..b].each {|el| el ? (print "#{el.val}     ") : (print "nil    ") }
      el_q *= 2
      a = b + 1
      b += el_q
    end
  end
end