#import <Foundation/Foundation.h>

@protocol DYSNode
-(id)initWithName: (NSString *) newName;
@property (copy) NSString *name;

@optional
-(void)addNode: (id<DYSNode>) node;
-(void)removeNode: (id<DYSNode>) node;
-(void)removeAllNodes;
-(id<DYSNode>)nodeWithName: (NSString *) _name;
-(void)printNodes;

@end
