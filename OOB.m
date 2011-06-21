#import <Foundation/Foundation.h>
#import "DYSUnit.h"
#import "DYSGroup.h"
#import "DYSPrinter.h"

int main (int argc, const char *argv[])
{

	// Set up a group and a few subgroups to nest in it.
	DYSGroup *testGroup = [DYSGroup groupWithName:@"group 1"];
	DYSGroup *testSubGroup1 = [DYSGroup groupWithName:@"subgroup 1"];
	DYSGroup *testSubGroup2 = [DYSGroup groupWithName:@"subgroup 2"];
	[testGroup addNode:[DYSUnit unitWithName:[NSString stringWithFormat:@"HQ"]]];
	[testGroup addNode:testSubGroup1];
	int i;
	for(i = 0; i < 2 ; i++) {
		[testGroup addNode:[DYSUnit unitWithName:[NSString stringWithFormat:@"unit %u", i]]];
	}
	for(i = 2; i < 4 ; i++) {
		[testSubGroup1 addNode:[DYSUnit unitWithName:[NSString stringWithFormat:@"unit %u", i]]];
	}
	[testSubGroup1 addNode:testSubGroup2];
	for(i = 4; i < 6 ; i++) {
		[testSubGroup2 addNode:[DYSUnit unitWithName:[NSString stringWithFormat:@"unit %u", i]]];
	}

	// Dump the group to a file, and restore it to another group
	NSString *archivePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"oob.archive"];
	[NSKeyedArchiver archiveRootObject:testGroup toFile:archivePath];
	DYSGroup *testDecodedGroup = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
	[testGroup isEqual:testDecodedGroup] ? NSLog(@"Equal!") : NSLog(@"Not equal!");

	// Remove a unit from a sub-group and see if they groups are still equal
	[testSubGroup1 removeNode:[testSubGroup1 nodeWithName:@"unit 2"]];
	[testGroup isEqual:testDecodedGroup] ? NSLog(@"Equal!") : NSLog(@"Not equal!");

	// Print the groups
	DYSPrinter *printer = [[DYSPrinter alloc] init];
	[printer printBasic:testGroup];
	[printer printBasic:testDecodedGroup];


	return 0;
}
