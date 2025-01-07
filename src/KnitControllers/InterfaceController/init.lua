local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local InterfaceController = Knit.CreateController({
	Name = "InterfaceController",
})

function InterfaceController:KnitInit() end

return InterfaceController
