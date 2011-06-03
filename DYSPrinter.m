#import "DYSPrinter.h"

@implementation DYSPrinter
-(void)printBasic:(id<RXVisitable>)object {
	NSLog(@"%@", [object acceptVisitor:self]);
}

-(id)leaveGroup:(DYSGroup *)group withVisitedChildren:(id)units {
	return [NSString stringWithFormat: @"%@ (%@)", group.name, [units componentsJoinedByString: @"\t"]];
}

-(id)leaveUnit:(DYSUnit *)unit {
	return [NSString stringWithFormat: @"%@", unit.name];
}
/*
-(id)visitGroup:(id<RXVisitable>)group {
	NSLog(@"%@", group);
	return self;
}

-(id)visitUnit:(id<RXVisitable>)unit {
	NSLog(@"\t%@\n", unit);
	return self;
}
*/
-(NSString *)nameForObject:(id<RXVisitable>)object {
	return [object isKindOfClass: [DYSGroup class]] ? @"Group" : @"Unit";
}

@end
