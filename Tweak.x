@import UIKit;
@import QuartzCore;

@interface NCNotificationViewController : UIViewController
@property (nonatomic, strong) UIView *ourView;
@end

static BOOL testSwitchKey;

static void preferencesChanged() {
    NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName:@"com.dingus.TutorialPrefs"];
    testSwitchKey = [prefs objectForKey:@"testSwitchKey"] ? [prefs boolForKey:@"testSwitchKey"] : YES;
}

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
