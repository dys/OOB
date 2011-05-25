#import <Foundation/Foundation.h>
#import "DYSUnit.h"
#import "DYSGroup.h"

int main (int argc, const char *argv[])
{
	DYSGroup *testGroup = [DYSGroup groupWithName:@"group 1"];
	[testGroup addNode:[DYSUnit unitWithName:[NSString stringWithFormat:@"HQ"]]];
	int i;
	for(i = 0; i < 5 ; i++) {
		[testGroup addNode:[DYSUnit unitWithName:[NSString stringWithFormat:@"unit %u", i]]];
	}
	[testGroup printNodes];
	[testGroup removeNode:[testGroup nodeWithName:@"unit 3"]];
	[testGroup removeNode:[testGroup nodeWithName:@"unit 10"]];
	[testGroup printNodes];
	[testGroup removeAllNodes];
	[testGroup printNodes];
	

	
	return 0;
}
