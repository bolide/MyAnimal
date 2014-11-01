#encoding:utf-8
class Array

  # Chooses a random array element from the receiver based on the weights
  # provided. If _weights_ is nil, then each element is weighed equally.
  #
  #   [1,2,3].random          #=> 2
  #   [1,2,3].random          #=> 1
  #   [1,2,3].random          #=> 3
  #
  # If _weights_ is an array, then each element of the receiver gets its
  # weight from the corresponding element of _weights_. Notice that it
  # favors the element with the highest weight.
  #
  #   [1,2,3].random([1,4,1]) #=> 2
  #   [1,2,3].random([1,4,1]) #=> 1
  #   [1,2,3].random([1,4,1]) #=> 2
  #   [1,2,3].random([1,4,1]) #=> 2
  #   [1,2,3].random([1,4,1]) #=> 3
  #
  # If _weights_ is a symbol, the weight array is constructed by calling
  # the appropriate method on each array element in turn. Notice that
  # it favors the longer word when using :length.
  #
  #   ['dog', 'cat', 'hippopotamus'].random(:length) #=> "hippopotamus"
  #   ['dog', 'cat', 'hippopotamus'].random(:length) #=> "dog"
  #   ['dog', 'cat', 'hippopotamus'].random(:length) #=> "hippopotamus"
  #   ['dog', 'cat', 'hippopotamus'].random(:length) #=> "hippopotamus"
  #   ['dog', 'cat', 'hippopotamus'].random(:length) #=> "cat"
  def random(weights=nil)
    return random(map {|n| n.send(weights)}) if weights.is_a? Symbol

    weights ||= Array.new(length, 1.0)
    total = weights.inject(0.0) {|t,w| t+w}
    point = rand * total
    # p total
    # p zip(weights)

    zip(weights).each do |n,w|
      # p "n#{n}   w#{w}  point#{point}"
      return n if w >= point
      point -= w
    end
  end

  # Generates a permutation of the receiver based on _weights_ as in
  # Array#random. Notice that it favors the element with the highest
  # weight.
  #
  #   [1,2,3].randomize           #=> [2,1,3]
  #   [1,2,3].randomize           #=> [1,3,2]
  #   [1,2,3].randomize([1,4,1])  #=> [2,1,3]
  #   [1,2,3].randomize([1,4,1])  #=> [2,3,1]
  #   [1,2,3].randomize([1,4,1])  #=> [1,2,3]
  #   [1,2,3].randomize([1,4,1])  #=> [2,3,1]
  #   [1,2,3].randomize([1,4,1])  #=> [3,2,1]
  #   [1,2,3].randomize([1,4,1])  #=> [2,1,3]
  def randomize(weights=nil)
    return randomize(map {|n| n.send(weights)}) if weights.is_a? Symbol

    weights = weights.nil? ? Array.new(length, 1.0) : weights.dup

    # pick out elements until there are none left
    list, result = self.dup, []
    until list.empty?
      # pick an element
      result << list.random(weights)
      # remove the element from the temporary list and its weight
      weights.delete_at(list.index(result.last))
      list.delete result.last
    end

    result
  end

  #ruby查找数组中重复的项 
  #[1,2,3,2,2,3]=>[2,3]
  def dups
    inject({}) {|h,v| h[v]=h[v].to_i+1; h}.select{|k,v| v > 1}.keys
  end

  #随机后获取对应数量的数组
  #[1,2,3,4,5].random_count   #=> [5]
  #[1,2,3,4,5].random_count(1)#=> [1]
  #[1,2,3,4,5].random_count(2)#=> [5, 3]
  #[1,2,3,4,5].random_count(0)#=> [5, 4, 2, 3, 1]
  #[1,2,3,4,5].random_count(9)#=> [2, 4, 1, 5, 3]
  def random_count(count=1)
    self.randomize[0..(count-1)]
  end
end