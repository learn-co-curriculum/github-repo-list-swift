//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FISReposDataStore: NSObject {
    
    static let sharedInstance = FISReposDataStore()
    
    var repositories:[FISGithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        FISGithubAPIClient.getRepositoriesWithCompletion { (reposArray) in
            for repoDictionary in reposArray {
                let repository = FISGithubRepository(dictionary: repoDictionary as! NSDictionary)
                self.repositories.append(repository)
                if self.repositories.count > 0 {
                    completion()
                }
            }
        }
    }

}
