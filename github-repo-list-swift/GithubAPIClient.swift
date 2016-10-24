//
//  GithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer and Ian Rahman on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
        
    class func getRepositoriesWithCompletion(_ completion: @escaping ([[String:AnyObject]]) -> ()) {
        let urlString = "\(Secrets.githubAPIURL)/repositories?client_id=\(Secrets.githubClientID)&client_secret=\(Secrets.githubClientSecret)"
        let url = URL(string: urlString)
        let session = URLSession.shared
        guard let potentialURL = url else {assertionFailure("Invalid URL"); return}
        let task = session.dataTask(with: potentialURL, completionHandler: { (data, response, error) in
            guard let data = data else { assertionFailure("Unable to get data \(error?.localizedDescription)"); return }
            if let responseArray = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:AnyObject]] {
                if let responseArray = responseArray {
                    completion(responseArray)
                }
            }
        }) 
        task.resume()
    }
    
}

