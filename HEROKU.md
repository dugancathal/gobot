Deploying to Heroku:

1. `git checkout master`
1. `git pull`
1. `git checkout heroku`
1. `git rebase master`
1. `go get github.com/kr/godep` if you don't already have Godep installed
1. `godep save` - if this command pulls in untracked Godep files, amend them to the top commit on the `heroku` branch
1. `git push -f heroku heroku:master`
1. `heroku open` to verify the app is running correctly
1. `git push -f origin heroku` if you had to add any Godep files. Verify that the `heroku` branch is up to date with `master` first!