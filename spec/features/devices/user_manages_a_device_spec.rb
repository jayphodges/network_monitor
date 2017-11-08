require 'rails_helper'

RSpec.feature "User can log in with Github" do
  before(:each) do
    OmniAuth.config.test_mode = true
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

  feature "user can login" do
    scenario "user visits homepage and logs in with GitHub" do
      visit "/"

      expect(page).to have_content('Login with Github')

      click_link 'Login with Github'

      expect(current_path).to eq('/devices')
    end
  end

  feature "user can manage device" do
    scenario "user can add, modify, and delete device" do
      visit "/"
      click_link 'Login with Github'

      expect(page).to have_content('Devices')

      click_link 'Add Device'

      expect(current_path).to eq('/devices/new')

      fill_in "Name", with: "Optimus"
      fill_in "Mac", with: "00:a0:bc:01:02:03"

      click_on "Create Device"

      expect(current_path).to eq('/devices')
      expect(page).to have_content('Optimus')

      click_on "Optimus"

      click_on "Edit Name"

      fill_in "Name", with: "Prime"

      click_on "Update Device"

      expect(page).to have_content('Prime')

      visit "/devices"

      click_on "Destroy"

      expect(page).to_not have_content("Prime")
    end
  end

end
