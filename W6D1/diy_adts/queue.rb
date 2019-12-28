class Queue
    def initialize 
        new_stack = []
    end 

    def enqueue(el)
        new_stack << el
    end 
    
    def dequeue
        new_stack.shift
    end 

    def peek
        new_stack.first
    end 
end 