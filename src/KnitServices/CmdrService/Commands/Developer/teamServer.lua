return function(_, players: { Player }, team: Team)
	for _, player in players do
		player.Team = team
	end
	return `Set team of {#players} players to {team.Name}.`
end
