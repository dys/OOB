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
	NSLog(@"action: adding %@ to %@", node.name, self.name);
	[nodes addObject:node];
}

-(void)removeNode: (id<DYSNode>) node {
	if (node != 0) {
		NSLog(@"action: removing %@ from %@", node.name, self.name);
		[nodes removeObject:node];
	}
}

-(void)removeAllNodes {
	NSLog(@"action: removing all nodes from %@:", self.name);
	[nodes removeAllObjects];
}

-(id<DYSNode>)nodeWithName: (NSString *) _name {
	NSLog(@"action: searching for %@", _name);
	for(id<DYSNode> node in nodes) {
		if ([node.name isEqualToString:_name]) {
			NSLog(@"status: found %@", node.name);
			return node;
		}
	}
	NSLog(@"status: nothing found.");
	return 0;
}

-(void)printNodes {
	if ([nodes count] > 0) {
		NSLog(@"status: children of %@:", self.name);
		for(id<DYSNode> node in nodes) {
			NSLog(@"    -> %@", node.name);
		}
	} else {
		NSLog(@"status: %@ has no children", self.name);
	}
}

@end
