local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.AddControllers(ReplicatedStorage.KnitControllers)

Knit.Start({ ServicePromises = true })
	:andThen(function()
		print("Knit started on client")
	end)
	:catch(warn)
