#import <Foundation/Foundation.h>
#import "JWIRootListController.h"

@implementation JWIRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
