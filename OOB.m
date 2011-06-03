#import <Foundation/Foundation.h>
#import "DYSUnit.h"
#import "DYSGroup.h"
#import "DYSPrinter.h"

int main (int argc, const char *argv[])
{

	// Testing a group with some units
	DYSGroup *testGroup = [DYSGroup groupWithName:@"group 1"];
	DYSGroup *testSubGroup = [DYSGroup groupWithName:@"subgroup 1"];
	[testGroup addNode:[DYSUnit unitWithName:[NSString stringWithFormat:@"HQ"]]];
	[testGroup addNode:testSubGroup];
	int i;
/*	for(i = 0; i < 5 ; i++) {
		[testGroup addNode:[DYSUnit unitWithName:[NSString stringWithFormat:@"unit %u", i]]];
	} */
	for(i = 6; i < 10 ; i++) {
		[testSubGroup addNode:[DYSUnit unitWithName:[NSString stringWithFormat:@"unit %u", i]]];
	}
//	[testGroup print];
//	[testGroup removeNode:[testGroup nodeWithName:@"unit 3"]];
//	[testGroup removeNode:[testGroup nodeWithName:@"unit 10"]];
//	[testGroup print];
//	[testGroup removeAllNodes];
	[testGroup print];

	DYSPrinter *printer = [[DYSPrinter alloc] init];
	[printer printBasic:testGroup];
		
	return 0;
}
