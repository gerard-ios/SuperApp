//
//  LoginEvents.swift
//  Login
//
//  Created by Adolfo Montilla on 19-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import Core

public enum LoginEvent: Event
{
    //case didLogin
    case itauPass
    //case passwordRecovery
}

public enum InternalLoginEvent: Event
{
//    case showRecoveryPass
//    case didLogin
//    case showBenefits
//    case showHelp
    case showItauPass
//    case Biometric
//    case firstAcces
//    case ChangeUserInformation
}
