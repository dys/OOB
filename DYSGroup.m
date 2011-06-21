#import "DYSGroup.h"

@implementation DYSGroup

@synthesize name;
@synthesize nodes;

+(DYSGroup *)groupWithName:(NSString *)name {
	return [[self alloc] initWithName:name];
}

-(id)init {
	if ((self = [super init])) {
		nodes = [NSMutableArray array];
	}
	return (self);
}

-(id)initWithName:(NSString *) newName {
	if ((self = [self init])) {
		name = newName;
	}
	return (self);
}

-(void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:name forKey:@"DYSName"];
	[coder encodeObject:nodes forKey:@"DYSNodes"];
}

- (id)initWithCoder:(NSCoder *)coder {
	self = [super init];
	name = [coder decodeObjectForKey:@"DYSName"];
	nodes = [coder decodeObjectForKey:@"DYSNodes"];
	return self;
}

-(void)addNode:(id<DYSNode>) node {
	DYSLog(@"action: adding %@ to %@", node.name, self.name);
	[nodes addObject:node];
}

-(void)removeNode:(id<DYSNode>) node {
	if (node != 0) {
		DYSLog(@"action: removing %@ from %@", node.name, self.name);
		[nodes removeObject:node];
	}
}

-(void)removeAllNodes {
	DYSLog(@"action: removing all nodes from %@", self.name);
	[nodes removeAllObjects];
}

-(id<DYSNode>)nodeWithName:(NSString *) _name { // TODO: this doesn't support recursion yet
	DYSLog(@"action: searching %@ for %@", self.name, _name);
	for(id<DYSNode> node in nodes) {
		if ([node.name isEqualToString:_name]) {
			DYSLog(@"status: found %@", node.name);
			return node;
		}
	}
	DYSLog(@"status: nothing found.");
	return 0;
}

-(void)print {
	NSLog(@"%@", self);
}

-(NSString *)description {
	return [NSString stringWithFormat:@"%@ (%@)", self.name, [[nodes valueForKey:@"description"] componentsJoinedByString:@", "]];
}

-(id)acceptVisitor:(id<RXVisitor>)visitor {
	[visitor visitObject: self];
	NSMutableArray *children = [[NSMutableArray alloc] init];
	for(id<RXVisitable> node in nodes) {
		id result = [node acceptVisitor: visitor];
		if(result) [children addObject: result];
	}
	return [visitor leaveObject: self withVisitedChildren: children];
}

-(BOOL)isEqual:(id)other {
	return [other isKindOfClass:[DYSGroup class]] && [self isEqualToGroup:other];
}

-(BOOL)isEqualToGroup:(DYSGroup *)other {
	return [other.name isEqualToString:self.name] && [other.nodes isEqualToArray:self.nodes];
}

@end
