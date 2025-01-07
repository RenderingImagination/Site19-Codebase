return {
	Name = "team",
	Aliases = {},
	Description = "Assigns you or a set of players to a new team.",
	Group = "Developer",
	Args = {
		{
			Type = "players",
			Name = "players",
			Description = "The players to be teamed.",
		},
		{
			Type = "team",
			Name = "team",
			Description = "The team to be assigned.",
		},
	},
}
