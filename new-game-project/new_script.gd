extends Node2D

@onready var tilemap: TileMap = $TileMap  # adjust path if needed

# Called every frame (optional — for testing placing with mouse)
func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = event.position
		place_tile_with_object(mouse_pos, 5)  # Replace 5 with your actual object tile ID

func place_tile_with_object(position: Vector2, object_tile_id: int):
	var cell = tilemap.local_to_tile(position)

	# Remove base tile first (make it empty)
	tilemap.set_cell(0, cell, -1)

	# Place object tile (which should have transparency)
	tilemap.set_cell(0, cell, object_tile_id)
