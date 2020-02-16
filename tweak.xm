#import <Cephei/HBPreferences.h>

BOOL enabled;
BOOL classicEnabled;

%hook SBApplicationInfo

-(BOOL) wantsExclusiveForeground {
	return enabled ? NO : %orig;
}

-(BOOL) wantsFullScreen {
	return enabled ? NO : %orig;
}

-(BOOL) disablesClassicMode {
	return classicEnabled ? YES : %orig;
}

-(BOOL) _preventsLaunchInterfaceSplitting {
	return enabled ? NO : %orig;
}
%end

%hook SBApplication

- (long long) _classicModeFromSplashBoard {
	return classicEnabled ? 0 : %orig;
}

- (long long)_phoneOnPad_classicModeFromSplashBoard {
	return classicEnabled ? 0 : %orig;
}

-(BOOL) iconAllowsLaunch:(id)arg {
	return enabled ? YES : %orig;
}

-(BOOL) classicAppPhoneAppRunningOnPad {
	return classicEnabled ? NO : %orig;
}

-(BOOL) classicAppFullScreen {
	return classicEnabled ? NO : %orig;
}

-(BOOL) classicAppScaled {
	return classicEnabled ? NO : %orig;
}

-(BOOL) isClassic {
	return classicEnabled ? NO : %orig;
}

%end

%ctor {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.itsjafer.bettermultitasking"];
	[prefs registerBool:&enabled default:YES forKey:@"enabled"];
	[prefs registerBool:&enabled default:YES forKey:@"classicEnabled"];
	%init;
}