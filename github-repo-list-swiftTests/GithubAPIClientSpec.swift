//
//  GithubAPIClientSpec.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Quick
import Nimble
import Mockingjay

@testable import github_repo_list_swift

class GithubAPIClientSpec: QuickSpec {
    
    
    override func spec() {
        
        
        guard let path = NSBundle(forClass: self.dynamicType).pathForResource("repositories", ofType: "json") else { print("error getting the path"); return }
        
        guard let data = NSData(contentsOfFile: path) else { print("error getting data"); return }
        let repositoryArray = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
        
        self.stub(http(.GET, uri:"https://api.github.com/repositories"), builder: json(data))
        //        self.stub(uri("https://api.github.com/repositories"), builder: json(data))
        
        describe("getRepositories") {
            it("should get the proper repositories from Github") {
                waitUntil(action: { (done) in
                    GithubAPIClient.getRepositoriesWithCompletion({ (repos) in
                        
                        expect(repos).toNot(beNil())
                        expect(repos.count).to(equal(2))
                        expect(repos).to(equal(repositoryArray! as? NSArray))
                        done()
                        
                    })
                })
                
                
                
            }
        }
    }
}
