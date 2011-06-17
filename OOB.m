#import <Foundation/Foundation.h>
#import "DYSUnit.h"
#import "DYSGroup.h"
#import "DYSPrinter.h"

int main (int argc, const char *argv[])
{

	// Testing a group with some units
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
