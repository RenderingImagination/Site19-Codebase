return {
	Name = "echo",
	Aliases = { "=" },
	Description = "Echoes your text back to you.",
	Group = "Unrestricted",
	Args = {
		{
			Type = "string",
			Name = "Text",
			Description = "The text.",
		},
	},

	Run = function(_, text)
		return text
	end,
}
