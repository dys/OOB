#import <Foundation/Foundation.h>
#import "External/RXVisitor/RXVisitor.h"
#import "DYSGroup.h"
#import "DYSUnit.h"

@interface DYSPrinter : RXVisitor
-(void)printBasic:(id<RXVisitable>)object;
-(id)leaveGroup:(id<RXVisitable>)object withVisitedChildren:(id)units;
//-(id)visitGroup:(id<RXVisitable>)object;
-(id)leaveUnit:(id<RXVisitable>)object;
//-(id)visitUnit:(id<RXVisitable>)object;

@end
