return {
	Name = "teleport",
	Aliases = { "tp" },
	Description = "Teleports a player or set of players to one target.",
	Group = "Moderator",
	Args = {
		{
			Type = "players",
			Name = "From",
			Description = "The players to teleport",
		},
		{
			Type = "player",
			Name = "Destination",
			Description = "The player to teleport to",
		},
	},
}
