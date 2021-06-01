require "byebug"

# Write a method, pow(base, exponent), that takes in two numbers.
# The method should calculate the base raised to the exponent power.
# You can assume the exponent is always positive.
#
# Solve this recursively!
#
# Examples:
#
# pow(2, 0) # => 1 # 2^0 = 1
# pow(2, 1) # => 2 # 2^1 = 2
# pow(2, 5) # => 32 # 2^1(2) 2^2(4) 2^3(8) 2^4(16) = 32
                            #2^4(16) * 2^1(2) = 32
                            #2^3(8) * 2^1(2) = 16
                            #2^2(4) * 2^1(2) = 8
                            #2^1(2) * 2^1(2) = 4
# pow(3, 4) # => 81
# pow(4, 3) # => 64
def pow(base, exponent) #(2, 5)
    return 1 if exponent == 0
    base * pow(base, exponent-1) #pow(2, 4) * 2
                                #pow(2, 3) * 2 
                                #pow(2, 2) * 2 
                                #pow(2, 1) * 2 
end





# Write a method, lucas_number(n), that takes in a number.
# The method should return the n-th number of the Lucas Sequence.
# The 0-th number of the Lucas Sequence is 2.
# The 1-st number of the Lucas Sequence is 1
# To generate the next number of the sequence, we add up the previous two numbers.
#
# For example, the sequence begins: 2, 1, 3, 4, 7, 11, ...
#                               # return 2 if n == 0
#                               # return 1 if n == 1
                                #  4 =  3 + 1
                                #  3 =  2 + 1
                                #  2 =  1 + 1
                                #  1 = 1
                                #  0 = 2
                                #  [2,1, 3, 4] << (arr[-1] + arr[-2])
                            
# Solve this recursively!
#
# Examples:
#
# lucas_number(0)   # =>    2
# lucas_number(1)   # =>    1
# lucas_number(2)   # =>    3
# lucas_number(3)   # =>    4
# lucas_number(5)   # =>    11
# lucas_number(9)   # =>    76

def lucas_number(n)#3
    return 2 if n == 0
    return 1 if n == 1
    lucas_number(n - 1) + lucas_number(n-2)
                #2               #n =  #1
               #/ \                   
              #1   0                 
end

#def lucas_number(3)
    # return 2 if n == 0
    # return 1 if n == 1
    # lucas_number(n - 1) + lucas_number(n-2)

#end
         # ! /              
        # ! /                  

#def lucas_number(2)
    # return 2 if n == 0
    # return 1 if n == 1
#    lucas_number(n - 1) + lucas_number(n-2)
#end

  # ! /              
 # ! /  
#def lucas_number(1)
    # return 2 if n == 0
    # return 1 if n == 1
#    lucas_number(n - 1) + lucas_number(n-2)
#end

#def lucas_number(0)
    # return 2 if n == 0
    # return 1 if n == 1
#    lucas_number(n - 1) + lucas_number(n-2)
#end


#----------------------------------------------


# Write a method, sum_array(array), that takes in an array of numbers.
# The method should return the total sum of the elements.
# 
# Solve this recursively!
#
# Examples:
#
# sum_array([])             # => 0 #return 0 if array.length == 0
# sum_array([5])            # => 5 
# sum_array([5, 2])         # => 7
# sum_array([4, 10, -1, 2]) # => 15
def sum_array(array) # = [5, 2]
    return 0 if array.empty?
    popped = array.pop #2
#sum_array(array)  5   + 2
    sum_array(array) + popped 
end

# def sum_array(array) # = [5]
#     return 0 if array.empty?
#     popped = array.pop #5
#     sum_array(array) + array.pop  
#         0               5
# end

# def sum_array(array) # = []
#     return 0 if array.empty?    =  0
#     popped = array.pop
#     sum_array(array) + popped
# end


#----------------------------------------------




# Write a method, reverse_string(str), that takes in a string.
# The method should return the string with it's characters in reverse order.
#
# Solve this recursively!
#
# Examples:
# 
# reverse_string("")            # => "" 
# reverse_string("c")           # => "c"
# reverse_string("internet")    # => "tenretni"
# reverse_string("friends")     # => "sdneirf"
def reverse_string(str) # = friends
    return "" if str.empty?   #  empty = ""
    first = str.slice(0)  #f
    str.slice!(0)
    reverse_string(str) + first  
    #f          reverse_string("riends") 
end

# def reverse_string(str) # = friends
#     return "" if str.empty?   #  empty = ""
    
# end


#----------------------------------------------




# A 1-dimensional array is also known as a flattened array.
# Write a method, flatten(data), that accepts a single argument. The
# method should take in an array of any dimension and return the flattened
# version of that array. Solve this recursively.
#   
# Hint:
#  - if the argument is not an array, then we have reached the base case
#  - look up the documentation for how to check if data is an array or

    #! ****["something"].kind_of?(Array) or .is_a?(Array) => true*****
#
# Examples:
#
# array_1 = [1, 2, [[3, 4], [5, [6]]], [7, 8]]
# flatten(array_1)      # => [ 1, 2, 3, 4, 5, 6, 7, 8 ]
#
# array_2 = ['this', ['problem', 'is'], [['pretty', 'tough'], [[':)']]]]
# flatten(array_2)      # => [ 'this', 'problem', 'is', 'pretty', 'tough', ':)' ]
#
# flatten('base case')  # => [ 'base case' ]
#
# Another Hint:
#
# From the last example, you may be confused. We said that the method takes
# in an array as an arg, but we passed it a string?
# If data is not an array, then we can consider it as a 0-dimensional array.
#     0-dimensional array: 'some data'
#     1-dimensional array: ['some data']
#     2-dimensional array: [['some data']]
#     3-dimensional array: [[['some data']]]
def flatten(data)
   return [data] if !data.is_a?(Array)
   result = []
   data.each do |ele|
        if ele.is_a?(Array)
            result += flatten(ele)
        else
            result << ele
        end 
   end
    return result
end


# return [] if data.to_a?(Array)
#data.flatten