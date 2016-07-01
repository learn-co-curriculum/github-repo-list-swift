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
    private override init() {}
    
    var repositories:[GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        GithubAPIClient.getRepositoriesWithCompletion { (reposArray) in
            for dictionary in reposArray {
                guard let repoDictionary = dictionary as? NSDictionary else {assertionFailure("Object in reposArray is of non-dictionary type"); return}
                let repository = GithubRepository(dictionary: repoDictionary)
                self.repositories.append(repository)
                if self.repositories.count > 0 {
                    completion()
                }
            }
        }
    }

}
