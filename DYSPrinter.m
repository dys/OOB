#import "DYSPrinter.h"

@implementation DYSPrinter
+(NSArray *)addPrefix:(NSArray *)units {
	return [[NSString stringWithFormat:@"\t%@", [units componentsJoinedByString:@"\n\t"]] componentsSeparatedByString:@"\n"];
}

+(NSArray *)flattenArray:(NSArray *)array {
	NSMutableArray *flattened = [NSMutableArray array];
	for (id object in array) {
			if ([object isKindOfClass:[NSArray class]])
					[flattened addObjectsFromArray:[DYSPrinter flattenArray:object]];
			else
					[flattened addObject:object];
	}
	return flattened;
}

-(void)printBasic:(id<RXVisitable>)object {
	NSLog(@"\n%@", [[object acceptVisitor:self] componentsJoinedByString:@"\n"]);
}

-(id)leaveGroup:(DYSGroup *)group withVisitedChildren:(NSArray *)units {
	return [[NSArray arrayWithObject:group.name] arrayByAddingObjectsFromArray:[DYSPrinter addPrefix:[DYSPrinter flattenArray:units]]];
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
