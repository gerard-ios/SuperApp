//
//  BaseViewConfiguration.swift
//  Core
//
//  Created by Adolfo Montilla on 26-08-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation
import UIKit

public protocol BaseViewConfiguration
{
    func buildViewHierarchy()
    func setupConstraints()
    func configureView()
}

public extension BaseViewConfiguration
{
    func setupConfiguration()
    {
        self.buildViewHierarchy()
        self.setupConstraints()
        self.configureView()
    }
}
