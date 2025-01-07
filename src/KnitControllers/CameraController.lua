--!nocheck

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Component = require(ReplicatedStorage.Packages.Component)

local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local CameraPivotOffset = Vector3.new(0, 0.25, 0.15)

local CameraController = Knit.CreateController({
	Name = "CameraController",
	Cameras = {},
})

local function IsPlayerAlive(player: Player)
	if
		not player.Character
		or not player.Character:FindFirstChild("Humanoid")
		or player.Character.Humanoid.Health <= 0
	then
		return false
	end
	return true
end

local function GetClosestPlayer(cameraObject: MeshPart): Player?
	local closestDistance = 20
	local closestTarget
	for _, player in Players:GetPlayers() do
		if not IsPlayerAlive(player) then
			continue
		end
		local distance = player:DistanceFromCharacter(cameraObject.Position)
		if distance < closestDistance then
			closestDistance = distance
			closestTarget = player
		end
	end
	return closestTarget
end

local function LookAtTarget(cameraContainer: Model, target: Player, delta: number)
	local cameraObject: MeshPart = cameraContainer.Camera
	local targetPart: Part = target.Character.Head
	local targetPosition: Vector3 = targetPart.Position

	local startingCFrame = CFrame.new(cameraObject.Position + CameraPivotOffset)
	local endingCFrame = cameraObject.CFrame:Lerp(CFrame.new(startingCFrame.Position, targetPosition), delta)
	local x, y = endingCFrame:ToOrientation()

	cameraObject.Orientation = Vector3.new(math.max(math.deg(x), -45), math.deg(y), 0)
end

function CameraController:KnitInit()
	local CameraComponent = Component.new({ Tag = "Camera", Ancestors = { workspace } })
	CameraComponent.Started:Connect(function(component)
		local cameraObject: MeshPart? = component.Instance:FindFirstChild("Camera")
		if cameraObject then
			component.OriginalCFrame = cameraObject.CFrame
		end
		table.insert(CameraController.Cameras, component)
	end)
	CameraComponent.Stopped:Connect(function(component)
		local index = table.find(CameraController.Cameras, component)
		if index then
			table.remove(CameraController.Cameras, index)
		end
	end)
end

function CameraController:KnitStart()
	RunService:BindToRenderStep("Cameras", Enum.RenderPriority.Last.Value, function(delta: number)
		delta = math.min(1, delta * 15)
		for _, camera in CameraController.Cameras do
			local container = camera.Instance
			local cameraObject: MeshPart? = container:FindFirstChild("Camera")
			if not cameraObject or (CurrentCamera.CFrame.Position - cameraObject.Position).Magnitude > 75 then
				continue
			elseif cameraObject and not camera.OriginalCFrame then
				camera.OriginalCFrame = cameraObject.CFrame
			end
			local target = GetClosestPlayer(cameraObject)
			if not target then
				cameraObject.CFrame = cameraObject.CFrame:Lerp(camera.OriginalCFrame, delta)
				continue
			end
			LookAtTarget(container, target, delta)
		end
	end)
end

return CameraController
