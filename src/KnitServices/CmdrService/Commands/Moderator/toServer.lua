return function(context, destination: Player)
	local humanoidRootPart = destination.Character and destination.Character:FindFirstChild("HumanoidRootPart") :: Part?

	if not humanoidRootPart then
		return "Target player has no character."
	end

	local cframe = humanoidRootPart.CFrame

	if not context.Executor.Character or not context.Executor.Character:FindFirstChild("HumanoidRootPart") then
		return "You have no character."
	end

	context.Executor.Character.HumanoidRootPart.CFrame = cframe
	return "Teleported."
end
