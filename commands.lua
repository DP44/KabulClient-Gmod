-- TODO: Rewrite this entire file and clean it up.

concommand.Add('kh_help', function()
	MsgC(pS.g_pDefaultColor, '============================================================\n');
	MsgC(color_white,        'kh_help               - Shows this message.\n'                 );
	MsgC(color_white,        'kh_config             - Shows which features are toggled.\n'   );
	MsgC(pS.g_pDefaultColor, '------------------------------------------------------------\n');
	MsgC(color_white,        'kh_visuals_name        - Displays the player\'s name.\n'       );
	MsgC(color_white,        'kh_visuals_health      - Displays the player\'s health.\n'     );
	MsgC(color_white,        'kh_visuals_distance    - Displays the distance between you\n'  );
	MsgC(color_white,        '                         and the player.\n'                    );
	MsgC(color_white,        'kh_visuals_flatchams   - Toggles whether to render without\n'  );
	MsgC(color_white,        '                         lighting or to render with it.\n'     );
	MsgC(color_white,        'kh_visuals_fullbright  - Toggles fullbright.\n'                );
	MsgC(color_white,        'kh_visuals_propchams   - Renders prop chams.\n'                );
	MsgC(color_white,        '                         RED   - Attack prop.\n'               );
	MsgC(color_white,        '                         BLUE  - Defense prop.\n'              );
	MsgC(color_white,        '                         GREEN - Normal prop / Undetermined.\n');
	MsgC(color_white,        'kh_visuals_propinfo    - Draw prop information.\n'             );
	MsgC(color_white,        'kh_visuals_playerchams - Renders player chams.\n'              );
	MsgC(color_white,        'kh_visuals_healthbar   - Draws a bar representing player HP.\n');
	MsgC(color_white,        'kh_visuals_tracers     - Display tracers from the cursor to\n' );
	MsgC(color_white,        '                         each player actively rendered.\n'     );
	MsgC(color_white,        'kh_visuals_trajectory  - Shows a trajectory on all players\n'  );
	MsgC(color_white,        '                         in the air and moving at a high\n'    );
	MsgC(color_white,        '                         velocity predicting where the\n'      );
	MsgC(color_white,        '                         player will land.\n'                  );
	MsgC(color_white,        'kh_visuals_headbeams   - Renders a beam from the player\'s\n'  );
	MsgC(color_white,        '                         head extending all the way up.\n'     );
	MsgC(pS.g_pDefaultColor, '------------------------------------------------------------\n');
	MsgC(color_white,        'kh_misc_bunnyhop       - Toggles bunnyhopping.\n'              );
	MsgC(color_white,        'kh_misc_ropespam       - Toggles rope spam.\n'                 );
	MsgC(color_white,        'kh_misc_cameraspam     - Toggles camera spam.\n'               );
	MsgC(color_white,        'kh_misc_hitmarker      - Toggles hitsounds.\n'                 );
	MsgC(pS.g_pDefaultColor, '============================================================\n');
end)

concommand.Add('kh_config', function()
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Name = ', pCache.Visuals.Name, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Health = ', pCache.Visuals.Health, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Distance = ', pCache.Visuals.Distance, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.FlatChams = ', pCache.Visuals.FlatChams, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.HealthBar = ', pCache.Visuals.HealthBar, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.PlayerChams = ', pCache.Visuals.PlayerChams, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Fullbright = ', pCache.Visuals.Fullbright, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.PropChams = ', pCache.Visuals.PropChams, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.PropInfo = ', pCache.Visuals.PropInfo, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Tracers = ', pCache.Visuals.Tracers, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Trajectory = ', pCache.Visuals.Trajectory, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.HeadBeams = ', pCache.Visuals.HeadBeams, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Misc.BunnyHop = ', pCache.Visuals.BunnyHop, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Misc.RopeSpam = ', pCache.Visuals.RopeSpam, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Misc.CameraSpam = ', pCache.Visuals.CameraSpam, '\n')
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Misc.Hitmarker = ', pCache.Visuals.Hitmarker, '\n')
end)

concommand.Add('kh_debug_dump_hooks', function()
	PrintTable(hook.GetTable())
end)

concommand.Add('kh_debug_dump_netvars', function()
	PrintTable(BuildNetworkedVarsTable())
end)

concommand.Add('kh_debug_dump_concommands', function()
	local a, b = concommand.GetTable()
	PrintTable(a)
end)

concommand.Add('kh_visuals_name', function()
	pCache.Visuals.Name = not pCache.Visuals.Name
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Name = ', pCache.Visuals.Name, '\n')
end)

concommand.Add('kh_visuals_health', function()
	pCache.Visuals.Health = not pCache.Visuals.Health
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Health = ', pCache.Visuals.Health, '\n')
end)

concommand.Add('kh_visuals_distance', function()
	pCache.Visuals.Distance = not pCache.Visuals.Distance
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Distance = ', pCache.Visuals.Distance, '\n')
end)

concommand.Add('kh_visuals_flatchams', function()
	pCache.Visuals.FlatChams = not pCache.Visuals.FlatChams
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.FlatChams = ', pCache.Visuals.FlatChams, '\n')
end)

concommand.Add('kh_visuals_healthbar', function()
	pCache.Visuals.HealthBar = not pCache.Visuals.HealthBar
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.HealthBar = ', pCache.Visuals.HealthBar, '\n')
end)

concommand.Add('kh_visuals_playerchams', function()
	pCache.Visuals.PlayerChams = not pCache.Visuals.PlayerChams
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.PlayerChams = ', pCache.Visuals.PlayerChams, '\n')
end)

concommand.Add('kh_visuals_fullbright', function()
	pCache.Visuals.Fullbright = not pCache.Visuals.Fullbright
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Fullbright = ', pCache.Visuals.Fullbright, '\n')
end)

concommand.Add('kh_visuals_propchams', function()
	pCache.Visuals.PropChams = not pCache.Visuals.PropChams
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.PropChams = ', pCache.Visuals.PropChams, '\n')
end)

concommand.Add('kh_visuals_propinfo', function()
	pCache.Visuals.PropInfo = not pCache.Visuals.PropInfo
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.PropInfo = ', pCache.Visuals.PropInfo, '\n')
end)

concommand.Add('kh_visuals_tracers', function()
	pCache.Visuals.Tracers = not pCache.Visuals.Tracers
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Tracers = ', pCache.Visuals.Tracers, '\n')
end)

concommand.Add('kh_visuals_trajectory', function()
	pCache.Visuals.Trajectory = not pCache.Visuals.Trajectory
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.Trajectory = ', pCache.Visuals.Trajectory, '\n')
end)

concommand.Add('kh_visuals_headbeams', function()
	pCache.Visuals.HeadBeams = not pCache.Visuals.HeadBeams
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Visuals.HeadBeams = ', pCache.Visuals.HeadBeams, '\n')
end)

concommand.Add('kh_misc_bunnyhop', function()
	pCache.Misc.BunnyHop = not pCache.Misc.BunnyHop
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Misc.BunnyHop = ', pCache.Misc.BunnyHop, '\n')
end)

concommand.Add('kh_misc_ropespam', function()
	pCache.Misc.RopeSpam = not pCache.Misc.RopeSpam
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Misc.RopeSpam = ', pCache.Misc.RopeSpam, '\n')
end)

concommand.Add('kh_misc_cameraspam', function()
	pCache.Misc.CameraSpam = not pCache.Misc.CameraSpam
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Misc.CameraSpam = ', pCache.Misc.CameraSpam, '\n')
end)

concommand.Add('kh_misc_hitmarker', function()
	pCache.Misc.Hitmarker = not pCache.Misc.Hitmarker
	MsgC(pS.g_pDefaultColor, '[KuteHook]', color_white, ' pCache.Misc.Hitmarker = ', pCache.Misc.Hitmarker, '\n')
end)
