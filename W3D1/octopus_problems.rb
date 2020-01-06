#sluggish octopus
#O(n^2) time 
fishes = [
    'fish', 'fiiish', 
    'fiiiiish', 'fiiiish', 
    'fffish', 'ffiiiiisshh', 
    'fsh', 'fiiiissshhhhhh'
]

def biggest_fish(fishes)
    (0...fishes.length).each do |idx1|
        #switch to indicate when biggest fish found
        biggest_found = true  
        (0...fishes.length).each do |idx2|
            #make sure not compering same fish to each other
            next if idx1 == idx2
            biggest_found = false if fishes[idx1] < fishes[idx2]
        end 
    end 
    return fishes[idx1] if biggest_found
end 

#dominant octopus
#O(n log n)
def nlog_biggest_fish(fishes)
  #return biggest fish after array is sorted
  fishes.merge_sort()[-1]
end

class Array
 #merge_sort for dominant octopus
  def merge_sort(&prc)
    prc ||= Proc.new { |fish1, fish2| fish1.length <=> fish2.length }
    return self if count <= 1
    midpoint = count / 2
    left = self.take(midpoint).merge_sort(&prc)
    right = self.drop(midpoint).merge_sort(&prc)
    self.merge(left, right, &prc)
  end
  
  def merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    
    merged.concat(left + right)
  end
end

#clever octopus
#O(n)
def one_step_find(fishes)
    biggest_fish = fishes[0]
    fishes.each do |fish|
        biggest_fish = fish if biggest_fish.length < fish.length 
    end 
    biggest_fish
end 

# Dancing Octopus
# tile hash of directions and idx 
tiles = {
    "up" => 0,
    "right-up" => 1
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
     "left" => 6,
    "left-up" => 7
}

def slow_dance(direct, tiles)
    tiles.each_with_index do |tile, idx|
        return index if tile == direct
    end 
end

def fast_dance(direct, tiles)
    tiles[direct]
end


