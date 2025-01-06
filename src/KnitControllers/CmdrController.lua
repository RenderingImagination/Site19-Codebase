local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local CmdrClient = require(ReplicatedStorage:WaitForChild("CmdrClient") :: ModuleScript)

--- @class CmdrController
--- Responsible for handling Cmdr requests on the client.
local CmdrController = Knit.CreateController({
	Name = "CmdrController",
})

function CmdrController:KnitInit()
	CmdrClient.Registry:RegisterHook("BeforeRun", require(ReplicatedStorage.Helpers.CmdrBeforeRun))
end

function CmdrController:KnitStart()
	CmdrClient:SetActivationKeys({ Enum.KeyCode.Semicolon })
end

return CmdrController
