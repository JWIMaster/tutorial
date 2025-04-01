@import UIKit;
@import QuartzCore;

@interface NCNotificationViewController : UIViewController
@property (nonatomic, strong) UIView *ourView;
@end

//static BOOL testSwitchKey;

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
dingus

%end
