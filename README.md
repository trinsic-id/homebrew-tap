# homebrew-tap

Repository for maintaining custom Homebrew Taps

## Pushing new updates

- Update the corresponding formula file under `Formula` by updating the `url` to point to the new bundle
- Update the `sha256` file with the hash of that bundle *in lower case*
- Make a commit with a message: the name of the fomula and the version being updated, ex. `trinsic-cli 1.2.0`
- Push the changes to a new branch
- Create a PR with title equal to the commit message
- Only one formula per PR, do not submit multiple formula updates
- Wait for CI actions to complete, do not merge the PR manually!
- One completed, add label `pr-pull` to the PR. This will kick off actions that will close the PR and bottle the taps

> Do not push changes directly to `main`.
