CameraDefaultParams = {
	InitialHeading = 3.14159265,  -- Initial camera heading on map start, in radians. default is, 3.14159265,
	NearZoom = 9.0,				  -- Closest mouse can zoom in to terrain, measured in LOD units.
	FarZoom = -1,                 -- Farthest mouse can zoom out from terrain, measured in LOD units, -1 to ignore.
	NearFOV = 60.0,     		  -- FOV to use for perspective camera at nearest zoom, in degrees.
	FarFOV = 60.0,				  -- FOV to use for perspective camera at farthest zoom, in degrees.
	NearPitch = 30.0,			  -- Pitch of camera at nearest zoom, in degrees.
	FarPitch = 70.0,     		  -- Pitch of camera at farthest zoom, in degrees.
	ZoomAmount = 0.4,			  -- How far to zoom in response to the mouse wheel.
	ZoomSpeedSmall = 0.5,		  -- How fast the camera actually moves in response to a small zoom.
	ZoomSpeedLarge = 5,			  -- How fast the camera actually moves in response to a large zoom.
	SpinSpeed = 360,			  -- How fast mouse spins camera, in degrees across screen size.
	PanSpeed = 1,				  -- How fast the camera pans (with mouse movement).
	KeyPanSpeed = .56,			  -- How fast the camera pans with the keyboard buttons.
	JoyPanSpeed = 1,			  -- How fast the camera pans with the joystick controls.
	MinSpinPitch = 0.1,			  -- The min pitch resulting from a spin.
	MaxZoomMult = 1.1,			  -- Extra zoom out buffer so we can see the borders of the map clearly.
	JoyCameraNearZoom = 12.0	  -- Closest the joystick version can zoom to.
}

InitialDefaults = function()
	return table.copy(CameraDefaultParams)
end

-- CurrentCameraDefaults as a copy rather than with metatables because the engine ignores metatables with it's accessors
CurrentCameraDefaults = InitialDefaults()

UpdateCurrentCameraDefaults = function( data )
--	for k,v in data do
--		CurrentCameraDefaults[k] = v
--	end
end

ResetCameraDefaults = function()
--	CurrentCameraDefaults = InitialDefaults()
end