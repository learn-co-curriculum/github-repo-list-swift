//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore: NSObject {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories:[GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        GithubAPIClient.getRepositoriesWithCompletion { (reposArray) in
            for repoDictionary in reposArray {
                let repository = GithubRepository(dictionary: repoDictionary as! NSDictionary)
                self.repositories.append(repository)
                if self.repositories.count > 0 {
                    completion()
                }
            }
        }
    }

}
