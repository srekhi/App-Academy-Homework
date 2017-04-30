def inorder(root) #Left-root-right
  node = root
  s1 = Stack.new
  while true
    if !node.nil?
      s1.push(node)
      node = node.left
    else
      break if s1.empty? #break out of while looop
      node = s1.pop
      visit(node)
      node = node.right
    end
  end
end





def postorder(root) #left-right-root
  s1 = Stack.new
  s2 = Stack.new
  node = root

  s1.push(root)
  until s1.empty?
    s2.pop(s1.push)
    s1.push(node.left)
    s1.push(node.right)
  end

  until s2.empty?
    node_to_visit = s2.pop
    visit(node_to_visit)
  end

end







def postorder(root) #left-right-root
  node = root
  s1 = Stack.new
  s2 = Stack.new
  s1.push(root)

  until s1.empty?
    node = s1.pop
    s2.push(node)
    s1.push(node.left)
    s1.push(node.right)
  end

  until s2.empty?
    node_to_visit = s2.pop
    visit(node_to_visit)
  end
end



####TRIE STUF#####

#building a trie for spell checking:
class TrieNode
  attr_readers :character, :value
  def initialize
    @characters = Array.new(26) #each el in array is a new node.
    @value = nil
  end
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  def put(key)
    @root = put(root, key, 0)
  end

  def includes?(key)
    node = includes?(root, key, counter)
    return false if node.nil?
    node.value
  end

  def delete(key)
    root = delete(root, key, counter)
  end



  #in a trie, neither keys nor value are explicitly stored.


  private

  def delete(node, key, counter)
    return nil if node.nil? #key doesn't exist
    if key.length == counter
      node.value = false #remove the existence boolean
      node = nil if node.children.all?(&:nil?) # => make the node nil if its no longer needed
      return node #return node.
    end
    next_char = key[counter]
    next_node = node.characters[next_char]
    next_node = delete(next_node, key, counter+1)
  end

  def includes?(node, key, counter)
    return nil if node.nil?
    return true if counter == key.length
    next_char = key[counter]
    next_node = node.characters[next_char]
    get(next_node, key, counter+1)
  end

  def put(node, key, counter)
    node = TrieNode.new if node.nil? #reassign it.
    if counter == key.length
      node.value = true
      return node
    else
      next_char = key[counter]
      #if we have the word "search", the root has an array of 26 places. we follow the 's', so we follow counter index.
      next_node = node.characters[next_char]
      next_node = put(next_node, key, counter + 1)
    end
  end
end

#BFS/DFS on a tree-- n-ary tree
def bfs(root) #O(N) time, O(1) space.
  #uses queue
  #iterative

  #assuming each node has an array of children
  queue.enq(root)
  until queue.empty?
    node = queue.deq
    visit(node)
    node.children.each { |node| queue.enq(node) }
  end
end

def dfs(root, key) #space complexity is depth of tree, time is O(N)
  node = root
  return false if node.nil?
  return true if key == node
  node.children.each do |node|
    return true if dfs(node, key)
  end
  false
end

#DFS On a graph
def dfs(node)
  marked = []
  node.adj_vertices.each do |v|
    if !marked[v]
      marked[v] = true
      edge_to[v] = node
      dfs(v)
    end
  end
end

#priority queue implementation
class MaxPriorityQueue

  def initialize
    @store = []
  end

  def insert(val)
    @store << val
    swim
  end

  def delete(val)
  end

  def swim
    swimming_idx = @store.length - 1
    parent_idx = swimming_idx/2
    while swimming_idx > @store[swimming_idx/2] && swimming_idx > 1
      parent_idx = swimming_idx/2
      @store[swimming_idx], @store[parent_idx] =  @store[parent_idx], @store[swimming_idx]
      swimming_idx = parent_idx
    end
  end


end


#kruskal's algorithm: minimum spanning tree algorithm.
# An MST connects all vertices together without any cycles
# and with the minimum possible total edge weight.
# Sort edges in ascending weight.
# Add next edge to MST unless doing so would create a cycle.
# greedy algorithm
#
#
#
#
