#import "DYSUnit.h"

@implementation DYSUnit

@synthesize name;

+(DYSUnit *)unitWithName:(NSString *)name
{
  return [[self alloc] initWithName:name];
}

-(id)initWithName: (NSString *) newName
{
  if ((self = [super init])) {
    name = newName;
  }
  return (self);
}

-(void)print {
	NSLog(@"    -> %@", self);
}

-(NSString *)description {
	return self.name;
}

-(NSString *)nameForObject:(id<RXVisitable>)object {
	return @"Node";
}

-(id)acceptVisitor:(id<RXVisitor>)visitor {
	[visitor visitObject: self];
	return [visitor leaveObject: self withVisitedChildren: nil];
}

@end
