//
//  MockTwitterAuthenticator.swift
//  TweedleDumb
//
//  Created by Ian Keen on 2017-06-12.
//  Copyright © 2017 Mustard. All rights reserved.
//

import Foundation

extension MockTwitterAuthenticator {
    struct Request {
        let email: String
        let password: String
    }
}

final class MockTwitterAuthenticator: Authenticator {
    let name = "Twitter"

    func login(complete: @escaping (Result<String>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            complete(.success(UUID().uuidString))
        }
    }
    func logout() {
        //
    }
}
