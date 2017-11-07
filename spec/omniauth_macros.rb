module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:github] = {
      "provider"=>"github",
      "uid"=>"25351111",
      "info"=>
        {"nickname"=>"jayphodges",
          "email"=>'something@else.com',
          "name"=>"Jay P",
          "image"=>"https://avatars2.githubusercontent.com/u/25351111?v=4",
          "urls"=>{"GitHub"=>"https://github.com/jayphodges", "Blog"=>""}},
          "credentials"=>{"token"=>ENV['GITHUB_TOKEN'], "expires"=>false},
          "extra"=>
          {"raw_info"=> {
             "login"=>"jayphodges",
             "id"=>25351111,
             "avatar_url"=>"https://avatars2.githubusercontent.com/u/25351111?v=4",
             "gravatar_id"=>"",
             "url"=>"https://api.github.com/users/jayphodges",
             "html_url"=>"https://github.com/jayphodges",
             "followers_url"=>"https://api.github.com/users/jayphodges/followers",
             "following_url"=>"https://api.github.com/users/jayphodges/following{/other_user}",
             "gists_url"=>"https://api.github.com/users/jayphodges/gists{/gist_id}",
             "starred_url"=>"https://api.github.com/users/jayphodges/starred{/owner}{/repo}",
             "subscriptions_url"=>"https://api.github.com/users/jayphodges/subscriptions",
             "organizations_url"=>"https://api.github.com/users/jayphodges/orgs",
             "repos_url"=>"https://api.github.com/users/jayphodges/repos",
             "events_url"=>"https://api.github.com/users/jayphodges/events{/privacy}",
             "received_events_url"=>"https://api.github.com/users/jayphodges/received_events",
             "type"=>"User",
             "site_admin"=>false,
             "name"=>"Jay P",
             "company"=>"Turing 1706",
             "blog"=>"",
             "location"=>nil,
             "email"=>nil,
             "hireable"=>true,
             "bio"=>nil,
             "public_repos"=>41,
             "public_gists"=>10,
             "followers"=>1,
             "following"=>1,
             "created_at"=>"2017-01-25T17:51:48Z",
             "updated_at"=>"2017-11-07T15:36:13Z"},
           "all_emails"=>[]
         }
      }
  end
end
