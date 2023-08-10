--*****************************************************************************
--* File: lua/modules/ui/splash/splash.lua
--* Author: Chris Blackwell
--* Summary: create and control pre-game splash screens
--*
--* Copyright © 2022 Gas Powered Games, Inc.  All rights reserved.
--*****************************************************************************

local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local Movie = import('/lua/maui/movie.lua').Movie


local movies = {
------------------------------------------------------------------------------
    --{ "/movies/black_SE.sfd", {Cue = '', Bank = ''} },
    --{ "/movies/gpglogo.sfd", {Cue = '', Bank = '' } },
    --{ "/movies/FMV_AMD.sfd", {Cue = '', Bank = '' } },
    --{ "/movies/FMV_Criware.sfd", {Cue = '', '' } },
    --{ "/movies/FMV_Alienware.sfd", {Cue = '', Bank = '' } },
    --{ "/movies/FMV_ESRB.sfd", {Cue = '', '', }, {Cue = ''}, 'ESRB' },
    --{ "/movies/FMV_PEGI.sfd", {Cue = '', '', }, {Cue = ''}, 'PEGI' },
    --{ "/movies/FMV_USK.sfd", {Cue = '', '', }, {Cue = ''}, 'USK' },
    --{ "/movies/FMV_OFLC.sfd", {Cue = '', '', }, {Cue = ''}, 'OFLC' },
	{ "/movies/Cybran_Campaign.sfd", {Cue = '', Bank = '' } },
	{ "/movies/Ill_Campaign.sfd", {Cue = '', Bank = '' } },
	{ "/movies/UEF_Campaign.sfd", {Cue = '', Bank = '' } },
    --{ "/movies/FMV_Legal.sfd", {Cue = '', '' } },
	{ "/movies/FMV_Alienware.sfd", {Cue = '', Bank = '' } },
------------------------------------------------------------------------------
}

function CreateUI()
    if GetPreference("movie.nologo") then
        EngineStartFrontEndUI()
        return
    end

    GetCursor():Hide()

    local parent = UIUtil.CreateScreenGroup(GetFrame(0), "Splash ScreenGroup")
    AddInputCapture(parent)

    parent:TakeJoystickFocus()

    local movie = Movie(parent)
    LayoutHelpers.FillParentPreserveAspectRatio(movie, parent)
    movie:DisableHitTest()    -- get clicks to parent group

    movie.OnLoaded = movie.Play

    local currentMovie

    local function StartMovie(index)
        currentMovie = index
        local info = movies[index]
        local sound = info[2]
        local voice = info[3]
        local ratingsId = info[4]
        
        LOG( "Start Movie: "..info[1] )
        
        if ( ratingsId != nil ) then
			LOG( "RatingsId: "..ratingsId )
		end
		
        if ( ratingsId == nil or ratingsId == GetXboxLocaleRatingsId() ) then
			movie:Set(info[1], sound and Sound(sound), voice and Sound(voice))
		else 
			movie:Set("/movies/none", '', '')
		end
    end

    local function LeaveSplashScreen()
        RemoveInputCapture(parent)
        if movie.loadThread then
			KillThread( movie.loadThread )
			movie.loadThread = nil
        end
        parent:Destroy()
        EngineStartFrontEndUI()
        GetCursor():Show()
    end

    parent.HandleEvent = function(self, event)
        -- cancel movie playback on mouse click or key hit
        if event.Type == "ButtonPress" or event.Type == "KeyDown" or event.Type == "JoystickButtonRelease" then
            if event.KeyCode and event.Type != "JoystickButtonRelease" then
                if event.KeyCode == UIUtil.VK_ESCAPE or event.KeyCode == UIUtil.VK_ENTER or event.KeyCode == UIUtil.VK_SPACE or event.KeyCode == 1  or event.KeyCode == 3 then
                else
                    return true
                end
			elseif event.Type == "JoystickButtonRelease" then
                if not( (event.JoystickButton == "A" or event.JoystickButton == "Start") ) then
                    return true
                end
            end
            movie:Stop()
            if currentMovie < table.getn(movies) then
                StartMovie(table.getn(movies))
            else
                LeaveSplashScreen()
            end

            return true
        end
    end

    movie.OnFinished = function(self)
        movie:Stop()
        if currentMovie < table.getn(movies) then
            StartMovie(currentMovie + 1)
        else
            LeaveSplashScreen()
        end
    end

    StartMovie(1)
end
