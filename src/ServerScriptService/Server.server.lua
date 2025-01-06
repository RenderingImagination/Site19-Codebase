local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.AddServices(script.Parent.KnitServices)

Knit.Start()
	:andThen(function()
		print("Knit started on server")
	end)
	:catch(warn)
