//
//  IRefreshing.swift
//  RefresherDemo
//
//  Created by Amr Hesham on 12/8/20.
//  Copyright © 2020 VictoryLink. All rights reserved.
//

import Foundation

// MARK: - Typealias

typealias RequestManagerRefresher = Refresher<Network>


// MARK: IRefreshing

/// To be implemented by the request manager or network class
///
protocol IRefreshing: class {
    
    /// refresher instance the initalizer method of the conforming class should use to call the launch method
    ///
    var refresher: RequestManagerRefresher { get }
    
    /// Time interval to determine when to refresh  the token
    ///
    var timeIntervalToRefresh:Double { get }
    
    /// Number of trials to try refreshing the token
    ///
    var numberOfTrials:Int { get }
    
    /// Will be called automatically every amount of time depends on time Interval value
    ///
    func refresh()
    
    /// Call back method when the token is updated successfully, you can access the token here
    ///
    func onTokenUpdate(token: String)
    
}
