extends Node2D

#https://www.youtube.com/watch?v=pCsnxWDx3rM

@export var width = 80
@export var height = 60
@export var cell_size = 10
@export var percentage_of_walls = 0.45 # 45% chance of being a wall (true), 55% chance of being empty (false)
@export var generations = 4 # Number of iterations

var grid = [] #if false is ground, if true is wall

func _ready():
	randomize()
	_initialize_grid()
	_generate_cave()
	_draw_cave()


func _initialize_grid(): #generate random grid
	_check_values()
	for x in range(width):
		grid.append([])
		for y in range(height):
			grid[x].append(randf() < percentage_of_walls)
	pass


func _generate_cave(): # Apply cellular automata rules to create cave-like structures
	for i in range(generations):
		var new_grid = grid.duplicate(true)
		for x in range(width):
			for y in range(height):
				var wall_count = _count_neighboring_walls(x, y)
				if grid[x][y]: # If it's a wall
					new_grid[x][y] = wall_count > 3 # Turn into empty space if not enough surrounding walls
				else:# If it's a floor
					new_grid[x][y] = wall_count > 4 # Turn into a wall if too many surrounding walls
		grid = new_grid
	pass


func _count_neighboring_walls(x, y) -> int:
	var count = 0
	for i in range(-1, 2):
		for j in range (-1, 2):
			if i == 0 and j == 0:
				continue # Skip the center cell
			var nx = x + i
			var ny = j + y
			if nx < 0 or nx >= width or ny < 0 or ny >= height: # Check if the neighboring cell is out of bounds
				count += 1
			elif grid[nx][ny]:
				count += 1
	return count


func _draw_cave():
	for x in range(width):
		for y in range(height):
			var cell = ColorRect.new()
			cell.size = Vector2(cell_size, cell_size)
			cell.position = Vector2(x * cell_size, y * cell_size)
			cell.color = Color.BLACK if grid[x][y] else Color.WHITE
			add_child(cell)


func _check_values():
	if(percentage_of_walls >= 1):
		percentage_of_walls = 0.75
		print("must be smaller than 1")
	else: if(percentage_of_walls <= 0):
		percentage_of_walls = 0.25
		print("must be greater than 0")
		
	if(generations > 10):
		generations = 10
		print("must be smaller than 10")
	else: if(generations < 4):
		generations = 10
		print("must be greater than 4")
