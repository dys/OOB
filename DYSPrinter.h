#import <Foundation/Foundation.h>
#import "External/RXVisitor/RXVisitor.h"

@interface DYSPrinter : RXVisitor
{
	DYSPrinter *printer;
}

-(void)printBasic:(id<RXVisitable>)object;
-(id)leaveGroup:(id<RXVisitable>)object;
-(id)leaveUnit:(id<RXVisitable>)object;

@end
