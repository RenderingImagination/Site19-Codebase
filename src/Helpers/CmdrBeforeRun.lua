local IsStudio = game:GetService("RunService"):IsStudio()

return function(context)
	if not IsStudio and context.Executor.UserId ~= 71793537 then
		return "You do not have permission to run Cmdr commands."
	end
	return nil
end
