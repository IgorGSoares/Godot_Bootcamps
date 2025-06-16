extends Node2D

enum primitives {LINE, RECTANGLE, CIRCLE, NONE}
var cur_primitive = primitives.NONE

var first_pos: Vector2 = Vector2.ZERO
var last_pos: Vector2 = Vector2.ZERO

var dragging = false
var drag_start = Vector2.ZERO
var size

var lines:=[]
var rectangles:=[]
var circles:=[]


	#if Input.is_action_pressed("Mouse"):
		#print("hold")
	#if Input.is_action_just_pressed("Mouse"):
		#print("click")
	#if Input.is_action_just_released("Mouse"):
		#print("release")

func _unhandled_input(event):
	if cur_primitive == primitives.CIRCLE: #Circle
		_circle(event)
	if cur_primitive == primitives.RECTANGLE: #Rectangle
		_rectangle(event)
	if cur_primitive == primitives.LINE: #Line
		_line()


func _draw():
	for l in lines:
		draw_line(l.position, l.size, Color.YELLOW, 5.8)
	for r in rectangles:
		draw_rect(r, Color.BLUE, true)
	for c in circles:
		draw_circle(c.position, c.size.x, Color.RED, true)
		#draw_circle(position: Vector2, radius: float, color: Color, filled: bool = true, width: float = -1.0, antialiased: bool = false)


func _line():
	if Input.is_action_pressed("Mouse"):
		if first_pos == Vector2.ZERO: 
			first_pos = get_global_mouse_position()
		last_pos = get_global_mouse_position()
	if Input.is_action_just_released("Mouse"):
		lines.push_front(Rect2(first_pos, last_pos))
		first_pos = Vector2.ZERO
		last_pos = Vector2.ZERO
	queue_redraw()


func _rectangle(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			drag_start = event.position
			rectangles.push_front(Rect2(drag_start, Vector2.ZERO))
			
		elif dragging:
			dragging = false
			drag_start = Vector2.ZERO
			queue_redraw()

	if event is InputEventMouseMotion and dragging:
		rectangles[0] = Rect2(drag_start, get_global_mouse_position() - drag_start)
		queue_redraw()


func _circle(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			drag_start = event.position
			circles.push_front(Rect2(drag_start, Vector2.ZERO))
			
		elif dragging:
			dragging = false
			drag_start = Vector2.ZERO
			queue_redraw()

	if event is InputEventMouseMotion and dragging:
		circles[0] = Rect2(drag_start, get_global_mouse_position() - drag_start)
		queue_redraw()


func _on_line_pressed():
	cur_primitive = primitives.LINE
	#print(cur_primitive)
	pass # Replace with function body.


func _on_rectangle_pressed():
	cur_primitive = primitives.RECTANGLE
	#print(cur_primitive)
	pass # Replace with function body.


func _on_circle_pressed():
	cur_primitive = primitives.CIRCLE
	pass # Replace with function body.
