return function(context, bringPlayers)
	local destination = context.Executor.Character
		and context.Executor.Character:FindFirstChild("HumanoidRootPart") :: Part?
	local cframe = destination and destination.CFrame

	if not cframe then
		return "You have no character."
	end

	for _, player in bringPlayers do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = cframe
		end
	end

	return ("Teleported %d players."):format(#bringPlayers)
end
