#import "DYSGroup.h"

@implementation DYSGroup

@synthesize name;

+(DYSGroup *)groupWithName:(NSString *)name {
	return [[self alloc] initWithName:name];
}

-(id)init {
	if ((self = [super init])) {
		nodes = [NSMutableArray array];
	}
	return (self);
}

-(id)initWithName: (NSString *) newName {
	if ((self = [self init])) {
		name = newName;
	}
	return (self);
}

-(void)addNode: (id<DYSNode>) node {
	DYSLog(@"action: adding %@ to %@", node.name, self.name);
	[nodes addObject:node];
}

-(void)removeNode: (id<DYSNode>) node {
	if (node != 0) {
		DYSLog(@"action: removing %@ from %@", node.name, self.name);
		[nodes removeObject:node];
	}
}

-(void)removeAllNodes {
	DYSLog(@"action: removing all nodes from %@", self.name);
	[nodes removeAllObjects];
}

-(id<DYSNode>)nodeWithName: (NSString *) _name {
	DYSLog(@"action: searching for %@", _name);
	for(id<DYSNode> node in nodes) {
		if ([node.name isEqualToString:_name]) {
			DYSLog(@"status: found %@", node.name);
			return node;
		}
	}
	DYSLog(@"status: nothing found.");
	return 0;
}
/*
-(void)print {
	if ([nodes count] > 0) {
		DYSLog(@"status: children of %@:", self.name);
		for(id<DYSNode> node in nodes) {
			[node print];
		}
	} else {
		DYSLog(@"status: %@ has no children", self.name);
	}
}
*/

-(void)print {
	NSLog(@"%@", self);
}

-(NSString *)description {
	return [NSString stringWithFormat:@"%@ (%@)", self.name, [[nodes valueForKey:@"description"] componentsJoinedByString:@", "]];
}

@end
