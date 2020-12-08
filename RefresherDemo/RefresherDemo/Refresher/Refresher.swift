//
//  IRefresher.swift
//  RefresherDemo
//
//  Created by Amr Hesham on 12/8/20.
//  Copyright © 2020 VictoryLink. All rights reserved.
//

import Foundation

// MARK: - Refresher - Generic refresher class
///
class Refresher<T: IRefreshing> {
    
    /// The target that will conform IRefreshing usually the network manager
    ///
    internal weak var target: T?
    private var timer: Timer?
    private var trials: Int
    
    init(target: T?, trials: Int) {
        self.target = target
        self.trials = trials
    }
    
    /// The start point which will call the refresh method every amount of type depeneding on timer interval variable in IRefreshing
    ///
    public func launch(repeats: Bool, timeInterval: TimeInterval) {
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: repeats) { [weak self] _ in
            guard let target = self?.target, self?.trials ?? 0 > 0 else {
                self?.invalidate()
                return
            }
            target.refresh()
            self?.trials -= 1
        }
    }
    
    /// Call this method to stop repeating the timer
    ///
    public func invalidate() {
        timer?.invalidate()
    }
}


