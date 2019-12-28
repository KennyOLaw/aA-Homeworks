class Map 
    def initalize 
        stack_arr = []
    end 

    def set(key, value)
        idx = stack_arr.index {|sub| sub[0] == key}
        if idx 
            stack_arr[idx][1] = value
        else 
            stack_arr << [key, value]
        end 
    end 

    def get(key)
        stack_arr.each {|sub| return sub[1] if sub[0] == key}
        false
    end 

    def delete(key)
        stack_arr.delete! {|sub| sub[0] == key}
    end 

    def show 
        stack_arr
    end 

end 