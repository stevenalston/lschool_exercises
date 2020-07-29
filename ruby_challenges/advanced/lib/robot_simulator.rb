=begin

  P:
    Robot
    control Robot movements
    3 movements: 
      - turn right
      - turn left
      - advance
    Robot is on {x, y} coord
    numbers increase north to east 
    Commands given by String of uppercase letters
    #instance_methods
      orient(:north, :east, :south, :west)
      bearing - refers to the direction robot is currently facing
      turn_left
      turn_right
      advance
      coordinates => [0, 1], at(x, y)

    Simulator
    #instance_methods
     - instructions('direction') -> LAR
     - place(robot_obj, x_crd, y_crd, direction)
     - evaluate(robot_obj, 'string')
  E:
    The letter-string "RAALAL" means:
      - Turn right
      - Advance twice
      - Turn left
      - Advance once
      - Turn left yet again
  D:

    Input: 

    Output:

  A:
    Robot#orient
    :north - y_crd advance -> y += 1
    :east - y_crd advance -> x += 1
    :south - y_crd advance -> y -= 1
    :west - y_crd advance -> x -= 1

    Robot#turn_right
    orient = :north -> :east -> :south -> :west

    Robot#turn_left
    orient = :north -> :west -> south -> :east

  C:

=end

class Robot
  attr_accessor :bearing, :coordinates  # => nil

  DIRECTIONS = %i[north east south west]  # => [:north, :east, :south, :west]

  def initialize
    @bearing = nil      # => nil
    @coordinates = nil  # => nil
  end                   # => :initialize

  def orient(direction=nil)
    if DIRECTIONS.include? direction  # => true
      @bearing = direction            # => :south
    else
      raise ArgumentError
    end                               # => :south
  end                                 # => :orient

  def at(x_pos, y_pos)
   @coordinates = [x_pos, y_pos]  # => [8, 4]
  end                             # => :at

  def turn_right(ary = DIRECTIONS)
    direction = ary.find_index(bearing)
    @bearing = if ary.last != ary[direction]
                 ary[direction + 1]
               else
                 ary.first
               end
  end                                         # => :turn_right

  def turn_left
    turn_right(DIRECTIONS.reverse)
  end                               # => :turn_left

  def advance
    case @bearing
      when :north then @coordinates[1] += 1
      when :east then @coordinates[0] += 1
      when :south then @coordinates[1] -= 1
      when :west then @coordinates[0] -= 1
    end
  end                                        # => :advance

end  # => :advance

class Simulator
  def instructions(str)
    str.chars.map do |c|           # => ["L", "A", "A", "A", "R", "A", "L", "A"]
      case c.upcase                # => "L", "A", "A", "A", "R", "A", "L", "A"
        when 'R' then :turn_right  # => :turn_right
        when 'L' then :turn_left   # => :turn_left, :turn_left
        when 'A' then :advance     # => :advance, :advance, :advance, :advance, :advance
      end                          # => :turn_left, :advance, :advance, :advance, :turn_right, :advance, :turn_left, :advance
    end                            # => [:turn_left, :advance, :advance, :advance, :turn_right, :advance, :turn_left, :advance]
  end                              # => :instructions

  def place(obj, **args)
    obj.at(args[:x], args[:y])    # => [8, 4]
    obj.orient(args[:direction])  # => :south
  end                             # => :place

  def evaluate(obj, str)
    instructions(str).each do |el|  # => [:turn_left, :advance, :advance, :advance, :turn_right, :advance, :turn_left, :advance]
      obj.send(el)
    end
  end                               # => :evaluate
end                                 # => :evaluate

robot = Robot.new          # => #<Robot:0x00007fae89807070 @bearing=nil, @coordinates=nil>
simulator = Simulator.new  # => #<Simulator:0x00007fae89806ad0>

simulator.place(robot, x: 8, y: 4, direction: :south)  # => :south
simulator.evaluate(robot, 'LAAARALA') 
