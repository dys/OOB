#import "DYSNode.h"

@interface DYSGroup : NSObject <DYSNode>
{
	NSString *name;
	NSMutableArray *nodes;
}

+(DYSGroup *)groupWithName: (NSString *)name;

@end
