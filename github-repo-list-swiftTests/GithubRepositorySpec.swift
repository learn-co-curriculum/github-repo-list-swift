//
//  GithubRepositorySpec.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Quick
import Nimble

@testable import github_repo_list_swift

class GithubRepositorySpec: QuickSpec {
    
    override func spec() {
        describe("GithubRepository") {
            describe("init(dictionary:)") {
                let repoDictionary = [  "html_url":"https://github.com",
                                        "full_name":"test/test",
                                        "id":2 ]
                
                let correctID = repoDictionary["id"]
                let correctURL = repoDictionary["html_url"]
                let correctName = repoDictionary["full_name"]
                
                it("should create a Github Repository object with the correct data") {
                    let repo = GithubRepository(dictionary: repoDictionary)
                    expect(repo.repositoryID).to(equal(correctID))
                    expect(repo.htmlURL).to(equal(correctURL))
                    expect(repo.fullName).to(equal(correctName))
                }
            }
        }
    }

}
