#import <Foundation/Foundation.h>
#import "External/RXVisitor/RXVisitor.h"
#import "DYSGroup.h"
#import "DYSUnit.h"

@interface DYSPrinter : RXVisitor
+(NSArray *)addPrefix:(NSArray *)units;
+(NSArray *)flattenArray:(NSArray *)array;
-(void)printBasic:(id<RXVisitable>)object;
-(id)leaveGroup:(id<RXVisitable>)object withVisitedChildren:(id)units;
-(id)leaveUnit:(id<RXVisitable>)object;
//-(id)visitGroup:(id<RXVisitable>)object;
//-(id)visitUnit:(id<RXVisitable>)object;

@end
