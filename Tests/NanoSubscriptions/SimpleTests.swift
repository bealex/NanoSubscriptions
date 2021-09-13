//
// SimpleTests
// NanoSubscriptions
//
// Created by Alex Babaev on 13 September 2021.
// Copyright © 2021 Alex Babaev. All rights reserved.
//

import XCTest
import NanoSubscriptions

class SimpleTests: XCTestCase {
    func testSimplestThings() {
        var subscription: Any?
        var unSubscriptionSuccessful = false

        subscription = Subscription {
            unSubscriptionSuccessful = true
        }
        XCTAssertTrue(subscription != nil && !unSubscriptionSuccessful)
        subscription = nil
        XCTAssertTrue(subscription == nil && unSubscriptionSuccessful)
    }

    func testSubscriptionBox() {
        var box: SubscriptionBox? = SubscriptionBox()
        var unSubscriptionSuccessful = false
        Subscription {
            unSubscriptionSuccessful = true
        }.save(to: box)

        XCTAssertTrue(!unSubscriptionSuccessful)
        box = nil
        XCTAssertTrue(box == nil && unSubscriptionSuccessful)
    }

    func testSubscribers() {
        var subscriberCalledWithValue = 0
        var subscriberNotCalledWithValue = -239

        let subscribers = Subscribers<Int>()
        let subscription: Any? = subscribers.subscribe { subscriberCalledWithValue = $0 }
        var subscriptionAnother: Any? = subscribers.subscribe { subscriberNotCalledWithValue = $0 }

        XCTAssertTrue(subscriptionAnother != nil)
        subscriptionAnother = nil

        subscribers.fire(239)
        XCTAssertTrue(subscription != nil && subscriberCalledWithValue == 239)
        XCTAssertTrue(subscriberNotCalledWithValue == -239)
    }
}
