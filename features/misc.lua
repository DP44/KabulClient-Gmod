pS.pMisc = {}
pS.pMisc.pLastProp = nil
pS.pMisc.bFiringPhysgun = false

-- A table for the rope spammer.
pS.pMisc.tblMats = {
	"effects/alyxmonitor_talk", 
	"matsys_regressiontest/background", 
	"models/humans/male/group01/mike_facemap",
	"models/combine_soldier/combine_elite_player_head",
	"models/combine_soldier/combine_elite_player",
	"models/combine_soldier/combine_elite",
	"models/kleiner/walter_face",
	"models/police/barneyface",
	"debug/debugskeleton",
	"debug/mrmwireframe",
	"debug/env_cubemap_model",
	"debug/debugfbtexture0",
	"debug/debugreflect",
	"debug/debuglightmap",
	"debug/debugbrushwireframe",
	"debug/debugdecalwireframe",
	"debug/debugmrmnormals",
	"debug/debugparticlewireframe",
	"debug/debugmrmwireframezbuffer",
	"debug/debugspritewireframe",
	"debug/worldwireframe",
	"debug/worldwireframezbuffer",
	"dev/oceanbeneath",
	"dev/ocean",
	"dev/sev_water2_cheap",
	"models/weapons/v-toolgun_screen",
	"models/spawn_effect",
	"shadertest/GooInGlass",
	"sprites/physcannon_bluecore 1",
	"pp_texturize",
	"pp/toydown-top",
	"pp/dof",
	"pp/videoscale",
	"pp/downsample",
	"pp/sunbeams",
	"pp/videoupscale",
	"pp/sobel",
	"pp/bloom",
	"pp/add",
	"sprites/autoaim_1a",
	"sprites/white",
	"vgui/gfx/vgui/cs_logo",
	"vgui/gfx/vgui/ak47",
	"vgui/gfx/vgui/m3",
	"vgui/gfx/vgui/p228",
	"vgui/gfx/vgui/m4a1",
	"vgui/gfx/vgui/gign",
	"vgui/gfx/vgui/glock",
	"vgui/gfx/vgui/ump45",
	"vgui/gfx/vgui/vip",
	"vgui/gfx/vgui/urban",
	"vgui/gfx/vgui/tmp",
	"vgui/gfx/vgui/t_random",
	"vgui/gfx/vgui/solid_background",
	"particle/tinyfiresprites/tinyfiresprites",
	"particle/water/watersplash_001a_additive",
	"particle/antlion_goop3/antlion_goop3",
	"vgui/tools/ifm/rippletape",
	"dev/graygrid",
	"dev/twenty",
	"dev/dev_camo",
	"dev/dev_ceiling",
	"dev/dev_envmap",
	"editor/bullseye",
	"editor/basealphaenvmapmaskicon",
	"effects/ibeama",
	"dev/dev_glassfrosted01a",
	"editor/env_fire",
	"sprites/player_radio_ring",
	"vgui/timer",
	"vgui/white",
	"vgui/gamma",
	"vgui/dashed_line",
	"vgui/circle",
	"vgui/black",
	"vgui/ico_box1",
	"vgui/ico_box2",
	"vgui/ico_box12",
	"vgui/ico_box13",
	"vgui/ico_box14",
	"vgui/ico_box3",
	"vgui/ico_box4",
	"vgui/ico_box10",
	"vgui/ico_box11",
	"vgui/ico_box5",
	"vgui/ico_box6",
	"effects/bonk",
	"effects/moon",
	"particle/tinyfiresprites/tinyfiresprites",
	"particle/water/watersplash_001a_additive",
	"particle/antlion_goop3/antlion_goop3",
	"sprites/orangelight1_noz",
	"effects/bonk",
	"effects/moon",
	"metal/ibeam001b",
	"metal/metalstair001a",
	"sprites/glow08",
	"sprites/dot",
	"trails/laser",
	"vgui/servers/icon_replay_column",
	"gm_construct/flatgrass",
	"dev/water_normal",
	"debug/env_cubemap_model",
	"decals/decalgraffiti010a",
	"models/hostages/sandro_facemap",
	"models/humans/male/group01/vance_facemap",
	"models/weapons/v_toolgun/screen_bg",
	"ajacks/billboard",
	"decals/decalgraffiti036a",
	"decals/decalgraffiti038a",
	"decals/decalgraffiti043a_cs",
	"decals/decalgraffiti062a",
	"cs_assault/assault_building_decal03",
	"decals/decalgraffiti058a_cs",
	"sprites/crosshairs",
	"decals/concrete/shot5Z",
	"icon16/page_red",
	"icon16/star",
	"models/cs_italy/lantern2a",
	"gui/info",
	"introscreen/main",
	"models/hostages/cohrt",
	"models/mossman/mossman_face",
	"gui/gmod_logo",
	"effects/ar2_altfire1",
	"models/player/shared/gold_player",
	"models/props/cs_assault/moneytop",
	"gui/colors",
	"materials/modernmotd/ico-dollar",
	"models/humans/nypd/badge",
	"effects/tool_tracer",
	"models/breen/mouth",
	"vgui/resource/icon_vac_new",
	"icon16/emoticon_smile",
	"games/16/all",
	"icon16/monkey",
	"icon16/shield",
}

function pS.pMisc:BunnyHop(pCmd)
	if pCmd:KeyDown(IN_JUMP) and not pS.g_pLocalPlayer:IsFlagSet(FL_ONGROUND) then
		pCmd:SetButtons(bit.band(pCmd:GetButtons(), bit.bnot(IN_JUMP)))
	elseif pCmd:KeyDown(IN_JUMP) and pS.g_pLocalPlayer:IsFlagSet(FL_ONGROUND) then
		-- Once we hit the ground we give ourselves a little boost. 
		-- This allows us to go extremely fast on some servers.
		pCmd:SetForwardMove(10000)
	end
end

function pS.pMisc:Movement(pCmd)
	local MOVETYPE = pS.g_pLocalPlayer:GetMoveType()

	-- Are we alive?
	if pS.g_pLocalPlayer:Alive() then
		-- Make sure we aren't in a vehicle or in spectator mode.
		if not pS.g_pLocalPlayer:InVehicle() and pS.g_pLocalPlayer:GetObserverMode() == OBS_MODE_NONE then
			-- Check if we aren't in noclip or going up a ladder.
			if MOVETYPE ~= MOVETYPE_NOCLIP and MOVETYPE ~= MOVETYPE_LADDER then
				-- Should we run Bunnyhop code?
				if pCache.Misc.BunnyHop then
					pS.pMisc:BunnyHop(pCmd)
				end
			end
		end
	end
end

function pS.pMisc:RopeSpam(pCmd)
	if pCache.Misc.RopeSpam and pS.g_pLocalPlayer:Alive() then
		pS.g_pActiveWeapon = pS.g_pLocalPlayer:GetActiveWeapon();

		if pS.g_pActiveWeapon and pS.g_pActiveWeapon:IsValid() and 
		   pS.g_pActiveWeapon:GetClass() == 'gmod_tool' and 
		   pS.g_pActiveWeapon.current_mode == 'rope' and pCmd:KeyDown(IN_ATTACK) then
			pCmd:SetViewAngles(Angle(math.Rand(-89, 89), math.Rand(-180, 180), 0))

			-- Set the rope material to a random value in the list
			pS.g_pLocalPlayer:ConCommand(string.format('rope_material %s', table.Random(pS.pMisc.tblMats)))
			
			-- Spam IN_ATTACK
			if pCmd:CommandNumber() % 2 == 0 then 
				pCmd:SetButtons(bit.band(pCmd:GetButtons(), bit.bnot(IN_ATTACK)))
			end
		end
	end
end

function pS.pMisc:CameraSpam(pCmd)
	if pCache.Misc.CameraSpam and pS.g_pLocalPlayer:Alive() then
		pS.g_pActiveWeapon = pS.g_pLocalPlayer:GetActiveWeapon();

		if pS.g_pActiveWeapon and pS.g_pActiveWeapon:IsValid() and 
		   pS.g_pActiveWeapon:GetClass() == 'gmod_camera' and pCmd:KeyDown(IN_ATTACK) then
			if pCmd:CommandNumber() % 2 == 0 then
				pCmd:SetButtons(bit.band(pCmd:GetButtons(), bit.bnot(IN_ATTACK))) -- Shoot!
			end
		end
	end
end

function pS.pMisc:OnCreateMove(pCmd)
	-- Function Calls
	pS.pMisc:Movement(pCmd)
	pS.pMisc:RopeSpam(pCmd)
	pS.pMisc:CameraSpam(pCmd)
end
