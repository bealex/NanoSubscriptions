//
// SubscriptionBox
// NanoSubscriptions
//
// Created by Alex Babaev on 13 September 2021.
// Copyright © 2021 Alex Babaev. All rights reserved.
//

public class SubscriptionBox {
    var subscriptions: [Any] = []

    public init() {
    }
}

extension Subscription {
    @discardableResult
    public func save(to box: SubscriptionBox?) -> Any? {
        box?.subscriptions.append(self)
        return self
    }
}
