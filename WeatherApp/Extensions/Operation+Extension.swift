//
//  Operation+Extension.swift
//  WeatherApp
//
//  Created by Marinko on 7/30/21.
//

import Foundation

extension Array where Element: Operation {
    func onFinish(block: @escaping () -> Void) {
        let doneOperation = BlockOperation(block: block)
        self.forEach { [unowned doneOperation] in doneOperation.addDependency($0) }
    }
}
