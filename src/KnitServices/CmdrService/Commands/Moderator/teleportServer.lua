return function(_, fromPlayers, destination: Player)
	local humanoidRootPart = destination.Character and destination.Character:FindFirstChild("HumanoidRootPart") :: Part?

	if not humanoidRootPart then
		return "Target player has no character."
	end

	local cframe = humanoidRootPart.CFrame

	for _, player in fromPlayers do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame = cframe
		end
	end

	return ("Teleported %d players."):format(#fromPlayers)
end
