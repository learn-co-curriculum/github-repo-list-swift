//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient: NSObject {
        
    class func getRepositoriesWithCompletion(completion: (NSArray) -> ()) {
        let urlString = "\(githubAPIURL)/repositories?client_id=\(githubClientID)&client_secret=\(githubClientSecret)"
        let url = NSURL(string: urlString)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data, response, error) in
            guard let data = data else { print("Unable to get data \(error?.localizedDescription)"); return }
            
            if let responseArray = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSArray {
                completion(responseArray)
            }
        }
        task.resume()
        
    }
    
}

