# NeoMori

NeoMori is a summer project exploring contemporary software development and DevOps in a game development setting.

- [Project goals](#project-goals)
- [Installation](#installation)
- [Development](#development)
  - [Workflow](#workflow)
  - [Task management](#task-management)
  - [GitHub Actions](#actions)
  - [Creating a release](#creating-a-release)
  - [Project flow](#project-flow)
- [License](#license)

![NeoMori_Dashing](https://user-images.githubusercontent.com/62639702/126960849-7fe79e43-6ff5-489e-8cad-0f4ac8e0ca6a.gif "NeoMori Dashing")

## Project goals <a name="project-goals"/>

Game development has unique challenges which can make it difficult to adopt modern software development techniques and disciplines such as test driven development, automated software pipelines, etc.

NeoMori aims to explore and overcome those challenges and produce a comprehensive guide on how to do so for novice and veteran alike.

For a full list of challenges, check the [roadmap](docs/ROADMAP.md).

### About the game

It'd be hard to run a project on development practices in game development without doing any game development.
Underlying the project is the development of NeoMori, a fast-paced stealth platformer where players avoid detection while navigating through various levels.

## Installation <a name="installation"/>

1. Navigate to the [**Releases**](https://github.com/Praqma/GodotDevOps/releases) page
2. Download the latest release for your distribution
3. Unzip the release to a chosen directory
4. Follow instructions below for your distribution

### Windows

5. Rename the *`NeoMori`* file (not ~~*`NeoMori.pck`*~~) to *`NeoMori.exe`*
   - *This will be fixed in the future!*
6. Run *`NeoMori.exe`* and enjoy!

### Linux

5. Grant execute permissions to the game: `chmod +x NeoMori`
6. Run *`NeoMori`* and enjoy!

### Mac

Fair warning, the Mac dist is a little finicky at present.

5. Open your terminal in the directory you unzipped the release
7. Run the following:
    ```sh
    unzip NeoMori
    ls -lr@
    xattr -d -r com.apple.quarantine .
    open GodotDevOps.app
    ```
8. Enjoy!

## Development <a name="development"/>

### Workflow <a name="workflow"/>

- Commits should be tied to [an issue](https://github.com/Praqma/GodotDevOps/projects/1)
  - Reference the issue in the commit messages:
    `"WIP #3"`, `"Fixes #3"`
  - Release notes should be added in the commit body:
    `"Fixes #3 > New Feature: Giant lasers have been added to the player's arsenal"`
- Code changes should happen on a branch
  - Name: Related issue number, lowercase, dash-separated `3-add-giant-lasers`
- Merging is done through a pull request

### Task management <a name="task-management"/>

- All development tasks should always have a [corresponding issue](https://github.com/Praqma/GodotDevOps/projects/1)
- All work on the project should always be tied to an issue
- The board is divided into 5 categories: *Ungroomed*, *To Do*, *In Progress*, *Done* and *Scrapped*
- Issues are ordered by importance/priority

#### Ungroomed

Ungroomed issues tracks ideas, unrefined large scope issues or other work that is vaguely defined.

#### To Do

Issues in `To Do` have clearly defined _definitions of done_, a set of tasks that need to be finished before it can be considered done.

An issue should also take less than a full day to complete. Anything larger should be broken down into smaller issues.

For convenience's sake we allow "epics" to reside here as well. These are large issues used that help track progress of similarly-themed smaller issues.

#### In Progress

In Progress are issues currently being worked on.

As a rule of thumb, the amount of issues here shouldn't surpass the amount of project members at any given time. 
Essentially, a developer can't work on two  things at once.

It is perfectly fine to move issues back and forth between `To Do` and `In Progress`.

If an issue is larger than expected it can be broken down into smaller issues and placed in `To Do`.

When an issue has all its _definition of done_ marks checked, it can be merged in, closed and moved to `Done`.

#### Done 

Issues in `Done` are done and stay done.

If an issue needs revisiting, a new issue is created rather than reopening the original issue.

#### Scrapped

Issues are moved to `Scrapped` when they are no longer part of the project's scope.
They serve as a log of features once considered that didn't make the cut.

### GitHub Actions <a name="actions"/>

#### Build

The `build` workflow is triggered either on pull requests or when pushing to `main`.

It runs the unit tests, builds the game clients and archives them for testing.

#### Publish

The `publish` workflow is triggered on tag.

It takes the built clients from the `build` workflow and publishes them as a GitHub Release.

### Creating a release <a name="releasing"/>

1. Check out the commit you wish to release
    - *Only works if the commit has a successful build on main*
2. Run `.buildscripts/release.sh` and follow the prompts
3. Your commit should now be tagged with generated release notes
    - This will trigger the `publish` workflow, publishing the release

### Project flow <a name="project-flow"/>

The project as a whole loosely follows the following structure:

- Game development continuously ongoing
- Monday and Wednesday fikas and project discussion
- Friday demos
- During fikas and demos, we'll:
  - Find ways to improve our workflow, by either adding or removing processes/skills/tools
  - Book the time to hold some workshops/trainings to achieve those things
  - Where applicable, add them as isues to the board.

## License <a name="license"/>

This project is licensed under the [MIT license](LICENSE).
