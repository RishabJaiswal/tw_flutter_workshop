# Releasing the DLS library

The library is published to GitHub using Git tags, the workflow file for which can be
found [here].

1. Head over to the Github Actions tab, and select the workflow
   titled [Increase lib & playground version] from the sidebar.
2. Use the `Run workflow` button to run it against `main` branch & pass the `Version`
   parameter. For example, new `Version` can be `0.4.0`. Once the workflow is completed,
   github bot will raise a pull request to update the `CHANGELOG.md`, DLS library version
   in `pubspec.yaml`, and playground app's version in `./playground/pubspec.yaml`
3. Review & merge the pull request raised in `step 2`.
4. Once the PR is merged in, we will automatically release the library to GitHub.
   You can check the status of it [here](../../actions/workflows/release.yml).
5. When the release job has finished successfully, announce the release in the appropriate 
   Slack channels

Refer to [Readme] on how to use this DLS library in your Flutter project.

[Readme]: ../README.md
[here]: ../.github/workflows/release.yml
[//]: # (TODO: Update the link to your github respository's actions)
[Increase lib & playground version]: ../../actions/workflows/increase_version.yml
