# Github Repo List

In this lab your goal is to write a Github repository browser. To do this we are going to need to talk to the [Github repo API](https://developer.github.com/v3/repos/#list-all-public-repositories), parse the results, and then display the repo names in a `UITableView`.

## The API

The API for this particular task is actually pretty straightforward.

First you need to get a client id and client secret, by creating an app in your Github preferences. That may sound intimidating, but ultimately it's just a bit of bookkeeping. You can make one of those [here](https://github.com/settings/applications/new). Don't worry about the details too much -- it's just a formality. Once you do that, you'll have a client ID and secret which you can use in the URL for API requests. You can read the details on specifying those keys in Github's general API documentation [here](https://developer.github.com/v3/versions/).

Your client secret and ID should be kept private - we don't want other people to be able to use them! If you just put them directly in the URL you use for your API call, they'll be pushed onto Github and other people will be able to see them. To step around this, you can  create a file for your secrets that won't be tracked by Git. Instead of choosing 'Cocoa Touch Class' on the new file window, just create a Swift file called `Secrets`. Next, create constants for both your client ID and secret in `Secrets.swift`. You'll then be able to reference and use those constants in your URL when you write the function to talk to the API later on in the lab. Finally, open the `.gitignore` file from the root directory of your project, add `Secrets.swift` at the end of the file, then save and close it. Your client ID and secret will now actually be secret!

With your client ID and secret in hand, you can construct the URL for the list of all repositories:

```
https://api.github.com/repositories?client_id=YOUR_KEY&client_secret=YOUR_SECRET
```

`GET`ting that URL will give you a response like this:

```json
[
  {
    "id": 1,
    "name": "grit",
    "full_name": "mojombo/grit",
    "owner": {
      "login": "mojombo",
      "id": 1,
      "avatar_url": "https://avatars.githubusercontent.com/u/1?",
      "gravatar_id": "25c7c18223fb42a4c6ae1c8db6f50f9b",
      "url": "https://api.github.com/users/mojombo",
      "html_url": "https://github.com/mojombo",
      "followers_url": "https://api.github.com/users/mojombo/followers",
      "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
      "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
      "organizations_url": "https://api.github.com/users/mojombo/orgs",
      "repos_url": "https://api.github.com/users/mojombo/repos",
      "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
      "received_events_url": "https://api.github.com/users/mojombo/received_events",
      "type": "User",
      "site_admin": false
    },
    "private": false,
    "html_url": "https://github.com/mojombo/grit",
    "description": "**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.",
    "fork": false,
    "url": "https://api.github.com/repos/mojombo/grit",
    "forks_url": "https://api.github.com/repos/mojombo/grit/forks",
    "keys_url": "https://api.github.com/repos/mojombo/grit/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/mojombo/grit/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/mojombo/grit/teams",
    "hooks_url": "https://api.github.com/repos/mojombo/grit/hooks",
    "issue_events_url": "https://api.github.com/repos/mojombo/grit/issues/events{/number}",
    "events_url": "https://api.github.com/repos/mojombo/grit/events",
    "assignees_url": "https://api.github.com/repos/mojombo/grit/assignees{/user}",
    "branches_url": "https://api.github.com/repos/mojombo/grit/branches{/branch}",
    "tags_url": "https://api.github.com/repos/mojombo/grit/tags",
    "blobs_url": "https://api.github.com/repos/mojombo/grit/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/mojombo/grit/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/mojombo/grit/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/mojombo/grit/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/mojombo/grit/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/mojombo/grit/languages",
    "stargazers_url": "https://api.github.com/repos/mojombo/grit/stargazers",
    "contributors_url": "https://api.github.com/repos/mojombo/grit/contributors",
    "subscribers_url": "https://api.github.com/repos/mojombo/grit/subscribers",
    "subscription_url": "https://api.github.com/repos/mojombo/grit/subscription",
    "commits_url": "https://api.github.com/repos/mojombo/grit/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/mojombo/grit/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/mojombo/grit/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/mojombo/grit/issues/comments/{number}",
    "contents_url": "https://api.github.com/repos/mojombo/grit/contents/{+path}",
    "compare_url": "https://api.github.com/repos/mojombo/grit/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/mojombo/grit/merges",
    "archive_url": "https://api.github.com/repos/mojombo/grit/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/mojombo/grit/downloads",
    "issues_url": "https://api.github.com/repos/mojombo/grit/issues{/number}",
    "pulls_url": "https://api.github.com/repos/mojombo/grit/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/mojombo/grit/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/mojombo/grit/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/mojombo/grit/labels{/name}",
    "releases_url": "https://api.github.com/repos/mojombo/grit/releases{/id}"
  },
  {
    "id": 26,
    "name": "merb-core",
    "full_name": "wycats/merb-core",
    "owner": {
      "login": "wycats",
      "id": 4,
      "avatar_url": "https://avatars.githubusercontent.com/u/4?",
      "gravatar_id": "428167a3ec72235ba971162924492609",
      "url": "https://api.github.com/users/wycats",
      "html_url": "https://github.com/wycats",
      "followers_url": "https://api.github.com/users/wycats/followers",
      "following_url": "https://api.github.com/users/wycats/following{/other_user}",
      "gists_url": "https://api.github.com/users/wycats/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/wycats/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/wycats/subscriptions",
      "organizations_url": "https://api.github.com/users/wycats/orgs",
      "repos_url": "https://api.github.com/users/wycats/repos",
      "events_url": "https://api.github.com/users/wycats/events{/privacy}",
      "received_events_url": "https://api.github.com/users/wycats/received_events",
      "type": "User",
      "site_admin": false
    },
    "private": false,
    "html_url": "https://github.com/wycats/merb-core",
    "description": "Merb Core: All you need. None you don't.",
    "fork": false,
    "url": "https://api.github.com/repos/wycats/merb-core",
    "forks_url": "https://api.github.com/repos/wycats/merb-core/forks",
    "keys_url": "https://api.github.com/repos/wycats/merb-core/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/wycats/merb-core/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/wycats/merb-core/teams",
    "hooks_url": "https://api.github.com/repos/wycats/merb-core/hooks",
    "issue_events_url": "https://api.github.com/repos/wycats/merb-core/issues/events{/number}",
    "events_url": "https://api.github.com/repos/wycats/merb-core/events",
    "assignees_url": "https://api.github.com/repos/wycats/merb-core/assignees{/user}",
    "branches_url": "https://api.github.com/repos/wycats/merb-core/branches{/branch}",
    "tags_url": "https://api.github.com/repos/wycats/merb-core/tags",
    "blobs_url": "https://api.github.com/repos/wycats/merb-core/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/wycats/merb-core/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/wycats/merb-core/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/wycats/merb-core/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/wycats/merb-core/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/wycats/merb-core/languages",
    "stargazers_url": "https://api.github.com/repos/wycats/merb-core/stargazers",
    "contributors_url": "https://api.github.com/repos/wycats/merb-core/contributors",
    "subscribers_url": "https://api.github.com/repos/wycats/merb-core/subscribers",
    "subscription_url": "https://api.github.com/repos/wycats/merb-core/subscription",
    "commits_url": "https://api.github.com/repos/wycats/merb-core/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/wycats/merb-core/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/wycats/merb-core/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/wycats/merb-core/issues/comments/{number}",
    "contents_url": "https://api.github.com/repos/wycats/merb-core/contents/{+path}",
    "compare_url": "https://api.github.com/repos/wycats/merb-core/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/wycats/merb-core/merges",
    "archive_url": "https://api.github.com/repos/wycats/merb-core/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/wycats/merb-core/downloads",
    "issues_url": "https://api.github.com/repos/wycats/merb-core/issues{/number}",
    "pulls_url": "https://api.github.com/repos/wycats/merb-core/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/wycats/merb-core/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/wycats/merb-core/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/wycats/merb-core/labels{/name}",
    "releases_url": "https://api.github.com/repos/wycats/merb-core/releases{/id}"
  },
  ...
]
```

As you can see we have quite a lot of data on each repo. Take note of the structure of the data: it's an array of dictionaries, with each dictionary representing a single repository.

Before you get started, play around with the URL. Try to see what you get back from Postman and try fetching it using `NSURLSession` and friends. Once you have the data coming back from Github's server, follow the instructions below to complete the application.

## Instructions

There are a billion approaches to organizing programs that talk to an API. The approach we recommend involves a few tiers: the **API client**, the **data store**, and the **models**.

The idea at a high level is this:

- The API client is a relatively simplistic class whose sole job is to wrap up the nitty gritty of talking to an AI (building the URL, deserializing the JSON, and so on). It usually consists entirely of class methods, each of which executes one API request and calls back its closure with the response.
- The data store class is similar the the ones we've been building (with a singleton instance). It has methods that call methods on the API client, and uses the results to populate properties on itself.
- The models are custom classes that are used to encapsulate the data we get from the API. Rather than dealing with the raw dictionaries and arrays from the API's JSON responses, we convert that data into instances of the model classes.

### The API Client

  1. In the `GithubAPIClient` class, create a **class function** called `getRepositoriesWithCompletion(completion:)`. The job of this function is to fetch all the repositories from the Github API, and pass that array of dictionaries on to its completion closure.
      - This method should know the URL to hit for the API request, create the `NSURLSessionDataTask`, and kick it off.
      - In the completion closure for the data task, the method should deserialize the JSON data from the server.
      - But how does this method get those objects back to the person who called it? It should take *its own* closure as an argument, which accepts the array of dictionaries as a parameter and returns nothing. Check out [this helpful resource](https://www.weheartswift.com/closures/) for an explanation on how to include a closure as a parameter for a function. The closure should return nothing and take one argument, an array of dictionaries.

### The Model

Even though the raw data from the API is in the form of arrays and dictionaries, let's massage that data into actual classes for ease of use.

  1. Add some properties to the `GithubRepository` object. We will be massaging the dictionaries from the API into instances of this class. It should have at least the following properties, which will come directly from the dictionaries in the API response.
    - `fullName`, an `NSString` of the full name of the repository (e.g., "githubUser/nameOfRepo")
    - `htmlURL`, an `NSURL` of the page for the repository on Github's website
    - `repositoryID`, an `NSString` of the ID of the repository.
  2. Now we need some way to turn our dictionaries into instances of `GithubRepository`. Let's do this by giving the class a custom initializer, `init(dictionary:)`, that will take in a dictionary from the API and assign the properties based on the values in that dictionary. The relevant dictionary keys are `"full_name"`, `"id"`, and `"html_url"`.

### The Data Store

The data store's job is to use the methods on the API client, but take it one step further. It should turn the dictionaries from the API client's callback and turn them into actual instances of `GithubRepository`.

  1. Add a function to `ReposDataStore` called `getRepositoriesWithCompletion(completion:)` that calls the function of the same name from `GithubAPIClient`. Do the following within that function's completion closure:
  	- First, empty the data store's repositories array.
    - The completion closure to the API client function should use the `init(dictionary:)` method on `GithubRepository` to turn the dictionaries you receive into repository objects.
    - Each of those repository objects should be appended to the data store's repositories array.
    - Now we're in the same boat as in the API client, where we have some result that we got asynchronously and need to inform our caller that we're done. This means the `getRepositoriesWithCompletion(completion:)` needs **its** own completion closure. Just make this one take no arguments and return nothing (so its type will be `() -> ()`).

### All together now...

  1. In the `viewDidLoad` of your `ReposTableViewController`, retrieve the repos using the method on the `GithubDataStore` and display them in the table view!
    - Due to the way the UI interacts with threading in iOS, you may see nothing on screen until you try to scroll in the tableview. We'll talk about threading in more detail soon, but in order to interact with the UI from within an `NSURLSession` completion closure, we need to hop back to the main thread. You can do this like so:
    
    ```swift
    dispatch_async(dispatch_get_main_queue()) {
        // your code that touches the UI here, like, maybe:
        self.tableView.reloadData()
    }
    ```

