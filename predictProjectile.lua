local module = {}

function module:FindTimeToReach(shooterPosition, targetPosition, projectileSpeed, gravity)
	local distance = (targetPosition - shooterPosition).Magnitude
	local timeTaken = (distance / projectileSpeed)

	if gravity > 0 then
		local timeTaken = projectileSpeed/gravity+math.sqrt(2*distance/gravity+projectileSpeed^2/gravity^2)
	end
	
	return timeTaken
end

function module:FindLeadShot(targetPosition: Vector3, targetVelocity: Vector3, projectileSpeed: number, shooterPosition: Vector3, shooterVelocity: Vector3, gravity: number)	
	local distance = (targetPosition - shooterPosition).Magnitude

	local p = targetPosition - shooterPosition
	local v = targetVelocity - shooterVelocity
	local a = Vector3.new(0, math.abs(gravity), 0)

	local timeTaken = (distance / projectileSpeed)
	
	if gravity > 0 then
		local timeTaken = projectileSpeed/gravity+math.sqrt(2*distance/gravity+projectileSpeed^2/gravity^2)
	end

	local goalX = targetPosition.X + v.X*timeTaken + 0.5 * a.X * timeTaken^2
	local goalY = targetPosition.Y + v.Y*timeTaken + 0.5 * a.Y * timeTaken^2
	local goalZ = targetPosition.Z + v.Z*timeTaken + 0.5 * a.Z * timeTaken^2
	
	return Vector3.new(goalX, goalY, goalZ)
end

return module
