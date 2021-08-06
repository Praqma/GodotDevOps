extends Node2D

export var detectRadius : float = 200
export var viewAngle : float = 90
export var losSpeed : float = 3
export(int, LAYERS_3D_PHYSICS) var collisionLayer = 5
export var fovColor := Color(1,1,1,1)
export var losUndetectColor := Color(1,1,0,1)
export var losDetectColor := Color(1,0,0,1)
export(int, LAYERS_3D_PHYSICS) var drawCollisionLayer = 1
export (float) var coneResolution : float = 0.5
export (int) var edgeResolveIterations : int = 6
export (float) var edgeDstThreshold : float = 30
export (float) var refinementResolution : float = 6
export (int) var drawDistance : int = 750

onready var fovPolygon = $"Polygon2D"

var targets = PoolVector2Array()
var losRange : float = 0

export (bool) var drawDebugLines = true
var debugAngles := []

func find_targets_inside_radius(entities) -> PoolVector2Array:
	targets = PoolVector2Array()
	for entity in entities:
		if global_position.distance_to(entity) < detectRadius:
			targets.append(entity)
	return targets

func find_targets_inside_cone(entities) -> PoolVector2Array:
	targets = PoolVector2Array()
	for entity in entities:
		var angleToEntity = rad2deg(global_transform.x.angle_to((entity - global_position).normalized()))
		if abs(angleToEntity) < viewAngle/2:
			targets.append(entity)
	return targets

func find_targets_with_raycast(entities) -> PoolVector2Array:
	targets = PoolVector2Array()
	var space_state = get_world_2d().direct_space_state
	for	entity in entities:
		var collision = space_state.intersect_ray(global_position, entity, [self], collisionLayer)
		if collision and collision.collider.is_in_group("detectable"):
			targets.append(entity)
	return targets

func _process(delta):
	update()

func _physics_process(delta):
	var detectablesNodes = get_tree().get_nodes_in_group("detectable")
	var detectablesPos = PoolVector2Array()
	for n in detectablesNodes:
		detectablesPos.append(n.position)
	
	var inRadius = find_targets_inside_radius(detectablesPos)
	var inCone = find_targets_inside_cone(inRadius)
	targets = find_targets_with_raycast(inCone)
	
	if targets:
		losRange += losSpeed
		for target in targets:
			if global_position.distance_to(target) <= losRange:
				get_tree().reload_current_scene()
	else:
		losRange -= losSpeed
	losRange = clamp(losRange, 0, detectRadius)
	
	for n in detectablesPos:
		if global_position.distance_to(n) < drawDistance:
			draw_field_of_view()
			break

func draw_field_of_view():
	var stepCount = round(viewAngle * coneResolution)
	var stepAngleSize = viewAngle / stepCount
	
	debugAngles.clear()
	var vertices := PoolVector2Array()
	vertices.append(Vector2.ZERO)
	var oldViewCast : ViewCastInfo
	
	for i in stepCount + 1:
		var angle = global_rotation_degrees - viewAngle/2 + stepAngleSize * i
		debugAngles.append(angle - global_rotation_degrees)
		var newViewCast : ViewCastInfo = view_cast(angle)
		
		if i > 0:
			var edgeDstThresholdExceeded : bool =  abs(oldViewCast.distance - newViewCast.distance) > edgeDstThreshold
			if (oldViewCast.hit != newViewCast.hit 
			or (oldViewCast.hit and newViewCast.hit and edgeDstThresholdExceeded)):
				var edge : EdgeInfo = find_edge(oldViewCast, newViewCast)
				if edge.pointA != Vector2.ZERO:
					vertices.append(edge.pointA.rotated(-global_rotation))
				if edge.pointB != Vector2.ZERO:
					vertices.append(edge.pointB.rotated(-global_rotation))
			elif ( i > 1
			and oldViewCast.hit and newViewCast.hit
			and newViewCast.normal != oldViewCast.normal):
				var corner : EdgeInfo = find_corners(oldViewCast, newViewCast)
				if corner.pointA != Vector2.ZERO:
					vertices.append(corner.pointA.rotated(-global_rotation))
				if corner.pointB != Vector2.ZERO:
					vertices.append(corner.pointB.rotated(-global_rotation))
		
		vertices.append(newViewCast.point.rotated(-global_rotation))
		oldViewCast = newViewCast
	
	fovPolygon.polygons.clear()
	fovPolygon.polygon = vertices

func view_cast(angle : float) -> ViewCastInfo:
	var dir := Vector2(cos(deg2rad(angle)), sin(deg2rad(angle)))
	var space_state = get_world_2d().direct_space_state
	var hit = space_state.intersect_ray(global_position, global_position + dir.normalized() * detectRadius, [self], drawCollisionLayer)
	if hit:
		return ViewCastInfo.new(true, hit.position - global_position, (hit.position - global_position).length(), angle, hit.normal)
	return ViewCastInfo.new(false, dir * detectRadius, detectRadius, angle, Vector2.ZERO)

func find_edge(minViewCast : ViewCastInfo, maxViewCast : ViewCastInfo) -> EdgeInfo:
	var minAngle : float = minViewCast.angle
	var maxAngle : float = maxViewCast.angle
	var minPoint : Vector2 = Vector2.ZERO
	var maxPoint : Vector2 = Vector2.ZERO
	
	for i in edgeResolveIterations:
		var angle : float = (minAngle + maxAngle) / 2
		var newViewCast : ViewCastInfo = view_cast(angle)
		
		var edgeDstThresholdExceeded = abs(minViewCast.distance - newViewCast.distance) > edgeDstThreshold
		if newViewCast.hit == minViewCast.hit and not edgeDstThresholdExceeded:
			minAngle = angle
			minPoint = newViewCast.point
		else:
			maxAngle = angle
			maxPoint = newViewCast.point
	
	debugAngles.append(minAngle - global_rotation_degrees)
	debugAngles.append(maxAngle - global_rotation_degrees)
	return EdgeInfo.new(minPoint, maxPoint)

func find_corners(minViewCast : ViewCastInfo, maxViewCast : ViewCastInfo) -> EdgeInfo:
	var minAngle : float = minViewCast.angle
	var maxAngle : float = maxViewCast.angle	
	var minNormal : Vector2 = minViewCast.normal
	var maxNormal : Vector2 = maxViewCast.normal
	var minPoint : Vector2 = Vector2.ZERO
	var maxPoint : Vector2 = Vector2.ZERO

	for i in refinementResolution:
		var angle : float = (minAngle + maxAngle) / 2
		var newViewCast : ViewCastInfo = view_cast(angle)

		if newViewCast.normal == minNormal:
			minAngle = angle
			minNormal = newViewCast.normal
			minPoint = newViewCast.point
		if newViewCast.normal == maxNormal:
			maxAngle = angle
			maxNormal = newViewCast.normal
			maxPoint = newViewCast.point

	debugAngles.append(minAngle - global_rotation_degrees)
	debugAngles.append(maxAngle - global_rotation_degrees)
	return EdgeInfo.new(minPoint, maxPoint)

class ViewCastInfo:
	var hit : bool
	var point : Vector2
	var distance: float
	var angle : float
	var normal : Vector2

	func _init(hit : bool, point : Vector2, distance : float, angle : float, normal : Vector2):
		self.hit = hit
		self.point = point
		self.distance = distance
		self.angle = angle
		self.normal = normal

class EdgeInfo:
	var pointA : Vector2
	var pointB : Vector2 
	
	func _init(pointA : Vector2, pointB : Vector2):
		self.pointA = pointA
		self.pointB = pointB

func _draw():
	for target in targets:
		draw_line(Vector2.ZERO, to_local(target), losUndetectColor)
		draw_line(Vector2.ZERO, to_local(target).normalized() * losRange, losDetectColor, 2)
	
	if drawDebugLines:
		for a in debugAngles:
			var dir := Vector2(cos(deg2rad(a)), sin(deg2rad(a)))
			draw_line(Vector2.ZERO, dir.normalized() * detectRadius, Color.blue)
	
#	draw_line(Vector2.ZERO, Vector2(cos(deg2rad(-viewAngle/2)) * detectRadius, sin(deg2rad(-viewAngle/2)) * detectRadius), fovColor)
#	draw_line(Vector2.ZERO, Vector2(cos(deg2rad(viewAngle/2)) * detectRadius, sin(deg2rad(viewAngle/2)) * detectRadius), fovColor)
#	draw_arc(Vector2.ZERO, detectRadius, deg2rad(-viewAngle/2), deg2rad(viewAngle/2), 32, fovColor)
