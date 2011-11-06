#import <GHUnitIOS/GHUnit.h>

@interface TestTests : GHTestCase {}
@end

@implementation TestTests

-(BOOL)shouldRunOnMainThread {
    return NO;
}

-(void)setUp {
    GHTestLog(@"Up...");
}

-(void)tearDown {
    GHTestLog(@"Down...");
}

-(void) testBoring {
    GHTestLog(@"This test is boooooring...");
    
    // Assert something boring
    GHAssertEqualStrings(@"Boring", @"Boring", @"We have been less than boring");
}

-(void) testMagicialPony {
    GHAssertNotEqualStrings(@"Magical Pony", @"Not so magical Pony", @"Magically pony failure");
}

-(void) testDangerZone {
    GHAssertTrue(NO, @"We are not in the danger zone");
}

@end