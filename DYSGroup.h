#import "DYSNode.h"

@interface DYSGroup : NSObject <DYSNode>
{
	NSString *name;
	NSMutableArray *nodes;
}

@property (nonatomic, readonly) NSMutableArray *nodes;

+(DYSGroup *)groupWithName:(NSString *)name;
-(BOOL)isEqualToGroup:(DYSGroup *)group;

@end
