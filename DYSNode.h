#import <Foundation/Foundation.h>
#import "External/RXVisitor/RXVisitor.h"

#ifndef NDEBUG
#define DYSLog(_s, ...) NSLog(_s, ## __VA_ARGS__)
#else
#define DYSLog(_s, ...)
#endif

@protocol DYSNode <NSObject, RXVisitable, NSCoding>
-(id)initWithName: (NSString *) newName;
@property (copy) NSString *name;

-(void)print;

@optional
-(void)addNode: (id<DYSNode>) node;
-(void)removeNode: (id<DYSNode>) node;
-(void)removeAllNodes;
-(id<DYSNode>)nodeWithName: (NSString *) _name;

@end
