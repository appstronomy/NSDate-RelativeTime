#import "NSDate+RelativeTime.h"
#import "Kiwi.h"

SPEC_BEGIN(RelativeTimeSpec)

const uint MINUTE = 60;
const uint HOUR = 60*MINUTE;
const uint DAY = HOUR*24;
const uint WEEK = DAY*7;
const uint MONTH = DAY*30;
const uint YEAR = DAY*365;

describe(@"The NSDate class", ^{
    
    context(@"with a RelativeTime category", ^{
        
        it(@"should respond to the relativeTime method", ^{
            NSDate *date = [[NSDate alloc] init];
            [[date should] respondToSelector:@selector(relativeTime)];
        });
        
        it(@"should parse 2 seconds from now as now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:2];
            
            [[[date relativeTime] should] equal:@"now"];
        });
        
        it(@"should parse 2 seconds ago as now", ^{
            NSDate *date = [[NSDate date] dateByAddingTimeInterval:-2];
            
            [[[date relativeTime] should] equal:@"now"];
        });
    });
});

SPEC_END