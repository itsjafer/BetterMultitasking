#import <Cephei/HBPreferences.h>
#include <RemoteLog.h>

BOOL enabled;
BOOL classicEnabled;
BOOL multipleEnabled;

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

-(BOOL)supports64Bit {
	return enabled ? YES : %orig;
}

-(BOOL)supportsMultiwindow {
	return multipleEnabled ? YES : %orig;
}

-(BOOL)requiresHiDPI {
	return enabled ? YES : %orig;
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

-(BOOL) wantsLegacyFullscreenInterfaceOrientationBehaviors {
	return classicEnabled ? NO : %orig;
}

%end

%ctor {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.itsjafer.bettermultitasking"];
	[prefs registerBool:&enabled default:YES forKey:@"enabled"];
	[prefs registerBool:&classicEnabled default:YES forKey:@"classicEnabled"];
	[prefs registerBool:&multipleEnabled default:YES forKey:@"multipleEnabled"];
	%init;
}