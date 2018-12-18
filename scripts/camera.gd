extends Camera

# refs
onready var pivot = get_parent();

# vars
var cam_pitch = deg2rad(45.0);
var cam_yaw = 0.0;
var cam_distance = 50.0;

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var dir = Vector3.ZERO;
	
	# calculate camera rotation
	dir.x = sin(cam_yaw) * cos(cam_pitch);
	dir.y = sin(cam_pitch);
	dir.z = cos(cam_yaw) * cos(cam_pitch);
	
	# set camera transform
	transform.origin = dir.normalized() * cam_distance;
	transform.basis = transform.looking_at(Vector3.ZERO, Vector3.UP).basis;
