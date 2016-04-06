=begin
Description:

Here you will create the classic pascal's triangle. Your function will be passed the depth of the triangle and you code has to return the corresponding pascal triangle upto that depth

The triangle should be returned as a nested array.

for example:

pascal(5) # should return [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
To build the triangle, start with a single 1 at the top, for each number in the next row you just take the two numbers above it and add them together (except for the edges, which are all "1"). eg

          [1]
        [0 1   1 0]
       [1  2  1]
      [1  3  3  1]
here you get the 3 by adding the 2 and 1 above it.

=end

def pascaltr(n)
  return [] if n < 1
  
    res =[]
    n.times do |i|
      if i == 0
        res << [1]
      else
        tri = []
        aux = res.last.dup.unshift(0).push(0)
        aux.each_cons(2) do |k|
          tri << k.reduce(:+)
        end
        res << tri
      end
    end
    res
end

#puts pascaltr(1)
p pascaltr(5)


=begin

def pascal(depth)
  (1...depth).inject([[1]]) { |rows, _|
    rows << [1, *rows.last.each_cons(2).map { |a, b| a + b }, 1]
  }
end

def pascal(n)
  a = [[1]]
  (n - 1).times do
    a << ([0] + a.last + [0]).each_cons(2).map { |a| a.reduce(:+) }
  end
  a
end

=end