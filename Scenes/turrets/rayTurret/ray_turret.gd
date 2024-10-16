extends Turret

var can_fire := true
var ray_enabled := false
var ray_extension := 0.0
var ray_length := 400.0
var ray_duration := 2.0


var ice_frost_color := Color(0.678, 0.847, 0.902, 0.8)  # Light blue with some transparency
var ice_frost_color_end := Color(0.678, 0.847, 0.902, 0.0)  # Fully transparent at the end

func _ready():
	setup_ray_visuals()

func setup_ray_visuals():
	var ray_line = $HitArea/Line2D
	ray_line.default_color = ice_frost_color
	ray_line.width = 10  # Adjust as needed
	ray_line.gradient = Gradient.new()
	ray_line.gradient.colors = [ice_frost_color, ice_frost_color_end]

func _process(delta):
	super(delta)
	if ray_enabled and ray_extension < 1.0:
		ray_extension += 0.1
		activate_ray(ray_extension)
	if not ray_enabled and ray_extension > 0:
		ray_extension -= 0.01
		deactivate_ray(ray_extension)

func attack():
	if not $RayDuration.is_stopped():
		for a in $HitArea.get_overlapping_areas():
			var collider = a.get_parent()
			if collider.is_in_group("enemy"):
				collider.get_damage(damage)
	if is_instance_valid(current_target):
		if can_fire:
			can_fire = false
			ray_enabled = true
			$RayDuration.start()
	else:
		try_get_closest_target()

func activate_ray(ratio):
	if is_instance_valid(current_target):
		var angle := get_angle_to(current_target.position)
		var offset = Vector2(cos(angle), sin(angle)) * ray_length * ratio
		$HitArea/Line2D.set_point_position(1, offset)
		$HitArea/CollisionShape2D.shape.b = offset

func deactivate_ray(ratio):
	var offset = $HitArea/Line2D.get_point_position(1) * ratio
	$HitArea/Line2D.set_point_position(1, offset)
	$HitArea/CollisionShape2D.shape.b = offset

func _on_ray_duration_timeout():
	ray_enabled = false
	$AttackCooldown.start()

func _on_attack_cooldown_timeout():
	can_fire = true
