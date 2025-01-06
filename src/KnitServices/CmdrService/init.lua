local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Cmdr = require(ReplicatedStorage.Packages.Cmdr)

--- @class CmdrService
--- Responsible for handling Cmdr requests on the server.
local CmdrService = Knit.CreateService({
	Name = "CmdrService",
})

function CmdrService:KnitInit()
	Cmdr.Registry:RegisterHook("BeforeRun", require(ReplicatedStorage.Helpers.CmdrBeforeRun))
	Cmdr.Registry:RegisterTypesIn(script.Types)
	Cmdr.Registry:RegisterDefaultCommands({ "Help" })
	Cmdr.Registry:RegisterCommandsIn(script.Commands)
end

return CmdrService
