#import "DYSNode.h"

@interface DYSUnit : NSObject <DYSNode>
{
  NSString *name;
}

+(DYSUnit *)unitWithName: (NSString *)name;
@end
