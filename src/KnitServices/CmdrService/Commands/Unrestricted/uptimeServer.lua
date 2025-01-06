return function()
	local uptime = time()
	return ("%dd %dh %dm %ds"):format(
		math.floor(uptime / (60 * 60 * 24)),
		math.floor(uptime / (60 * 60)) % 24,
		math.floor(uptime / 60) % 60,
		math.floor(uptime) % 60
	)
end
