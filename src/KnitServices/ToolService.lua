local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local ToolService = Knit.CreateService({
	Name = "ToolService",
	Client = {},
})

function ToolService:KnitInit() end

return ToolService
