@import UIKit;
@import QuartzCore;
#import <spawn.h>


@interface NCNotificationViewController : UIViewController
@property (nonatomic, strong) UIView *ourView;
@end

static BOOL testSwitchKey;

//Preference code, don't understand it yet
static void preferencesChanged() {
    NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.dingus.TutorialPrefs"];
	testSwitchKey = [prefs objectForKey:@"testSwitchKey"] ? [prefs boolForKey:@"testSwitchKey"] : YES;
}

//Code that searches for a change in preference
%ctor {
    preferencesChanged();
}


%hook NCNotificationViewController
%property (nonatomic, strong) UIView *ourView;
//Grab notification bounds
-(void)viewDidLayoutSubviews {
    %orig;
    self.ourView.frame = self.view.bounds;
}

//Create notification glow and set colour and size
-(void)viewDidLoad {
	%orig;
	//Doesn't run if the switch is off
	if (!testSwitchKey) return;
	//Initilise the property from last function
	self.ourView = [[UIView alloc] init];
	self.ourView.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.7];
	self.ourView.layer.cornerRadius = 20;
	//Code for glow parameters
	self.ourView.layer.shadowColor = [UIColor greenColor].CGColor;
	self.ourView.layer.shadowOpacity = 0.7;
	self.ourView.layer.shadowRadius = 10;
	self.ourView.layer.shadowOffset = CGSizeZero;
    [self.view insertSubview:self.ourView atIndex:0];
}

%end
