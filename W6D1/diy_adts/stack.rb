class Stack
    def initialize
        stack_arr = []
    end 

    def push(el)
        stack_arr << el
    end 

    def pop
        stack_arr.pop
    end 

    def peek
        stack_arr.last
    end 
end 