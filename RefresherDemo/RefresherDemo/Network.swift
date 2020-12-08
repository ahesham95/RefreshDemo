//
//  Network.swift
//  RefresherDemo
//
//  Created by Amr Hesham on 12/8/20.
//  Copyright © 2020 VictoryLink. All rights reserved.
//

import Foundation

// MARK: - Network
//
class Network {
    //TODO: we need to check another solution to remove refresher.launch from init
    //TODO: i think the launcher should start on getTokenSuccess
    
    lazy var refresher: RequestManagerRefresher = Refresher(target: self, trials: self.numberOfTrials)
    // MARK: - Properties
    let session = URLSession.shared
    let url = URL(string: "https://learnappmaking.com/ex/users.json")!
    
    // MARK: - Init
    
    init() {
        refresher.launch(repeats: true, timeInterval: timeIntervalToRefresh)
    }
    

    
    func updateToken() {
        // Call the method responsable about updating the token here
        let task = session.dataTask(with: url, completionHandler: { [ weak self] data, response, error in
            if error == nil {
                self?.onTokenUpdate(token: response?.url?.absoluteString ?? "")
            } else {
                self?.updateToken()
            }

        })
        
        task.resume()
    }
    
    internal func onTokenUpdate(token: String) {
        print("Token updated do whatever you want with it")
    }
    
}

extension Network: IRefreshing {
    var numberOfTrials: Int {
        2
    }
    
    var timeIntervalToRefresh: Double {
        5
    }
    
    func refresh() {
        updateToken()
    }
    
    
}


