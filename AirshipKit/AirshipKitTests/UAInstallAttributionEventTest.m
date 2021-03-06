/*
 Copyright 2009-2017 Urban Airship Inc. All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE URBAN AIRSHIP INC ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL URBAN AIRSHIP INC OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <XCTest/XCTest.h>
#import "UAInstallAttributionEvent.h"

@interface UAInstallAttributionEventTest : XCTestCase

@end

@implementation UAInstallAttributionEventTest

/**
 * Test the event's type.
 */
- (void)testType {
    XCTAssertEqualObjects(@"install_attribution", [UAInstallAttributionEvent event].eventType);
}

/**
 * Test the event's data with purchase and impression dates.
 */
- (void)testData {
    NSDate *purchaseDate = [NSDate dateWithTimeIntervalSince1970:100.0];
    NSDate *iAdImpressionDate = [NSDate dateWithTimeIntervalSince1970:1000.0];

    UAInstallAttributionEvent *event = [UAInstallAttributionEvent eventWithAppPurchaseDate:purchaseDate
                                                                         iAdImpressionDate:iAdImpressionDate];

    XCTAssertEqualObjects(@"100.000000", [event.data objectForKey:@"app_store_purchase_date"]);
    XCTAssertEqualObjects(@"1000.000000", [event.data objectForKey:@"app_store_ad_impression_date"]);
    XCTAssertTrue(event.isValid);
}

/**
 * Test the event's data with no dates.
 */
- (void)testDataNoDates {
    UAInstallAttributionEvent *event = [UAInstallAttributionEvent event];
    XCTAssertEqual(0, event.data.count);
    XCTAssertTrue(event.isValid);
}

@end
