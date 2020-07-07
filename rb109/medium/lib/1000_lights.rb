=begin

  P:
  each pass the number of lights toggle is incremented. every light, every other light, every 3rd light, etc
  counter is incremented every iteration/pass through the hash
  E:
    toggle_lights(5) == [1, 4]
    toggle_lights(10) == [1, 4, 9]
  D:

    Input: Integer

    Output: Array

  A:

    SET- step = 1, lights = [{1: false}], result = []

    ITERATE- n times 
      ITERATE - lights array
        SET- hash = lights[idx]

    IF-

    ELSE-

    PRINT-

  C:

=end

def toggle_lights(n)
  step = 1
  result = []
  lights = (1..n).map {|x| {(x) => false}}
  n.times do 
    (step - 1...lights.size).step(step).each do |idx|
      hash = lights[idx]
      hash.each {|k, v| lights[idx][k] = !v}
    end
    step += 1
  end
  lights.each do |hsh|
    hsh.select {|k, v| result << k if v}
  end
    result
end

toggle_lights(5) == [1, 4]
toggle_lights(10) == [1, 4, 9]
toggle_lights(2) == [1]
p toggle_lights(1000)
puts '======================'


#lschool solution
# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights_ls(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights_ls(1000)