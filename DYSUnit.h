#import "DYSNode.h"

@interface DYSUnit : NSObject <DYSNode>
{
  NSString *name;
}

+(DYSUnit *)unitWithName:(NSString *)name;
-(BOOL)isEqualToUnit:(DYSUnit *)unit;
@end
