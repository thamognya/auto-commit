## Sample

```yml
name: mirror to repo

on: 
  schedule:
  - cron: '*/5 * * * *'

# Ensures that only one mirror task will run at a time.
concurrency:
  group: mirror-git-repo

jobs:
  auto-commit:
    runs-on: ubuntu-latest
    steps:
      - uses: ThamognyaKodi/auto-commit@0.0.1 
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
          EMAIL: ${{ github.event.pusher.email }}
          NAME: ${{ github.event.pusher.name }}
          BRANCH_ON_SOURCE_REPO: "master"
        with:
          source-repo: "git@_some_provider_:_user_name_/_repo_name_.git"
```

## License

This work is dual-licensed under MIT and GPL 3.0 (or any later version). You have to comply to both of them if you want to use this work.

`SPDX-License-Identifier: MIT AND GPL-3.0-or-later`

You can find the licenses in the licenses folder.
