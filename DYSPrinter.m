#import "DYSPrinter.h"

@implementation DYSPrinter
-(void)printBasic:(id<RXVisitable>)object {
	[object acceptVisitor:printer];
}

-(id)leaveGroup:(id<RXVisitable>)group {
	NSLog(@"%@", group);
	return self;
}

-(id)leaveUnit:(id<RXVisitable>)unit {
	NSLog(@"%@", unit);
	return self;
}

@end
