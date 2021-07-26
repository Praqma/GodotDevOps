# NeoMori

NeoMori is a summer project that explores contemporary software development and DevOps in a game development setting.

![NeoMori_Dashing](https://user-images.githubusercontent.com/62639702/126960849-7fe79e43-6ff5-489e-8cad-0f4ac8e0ca6a.gif "NeoMori Dashing")

The game is a fast-paced stealth platformer where the player has to make their way to the level exit whilst avoiding the detection of patroling enemies. However the main focus of the project isn't the outcome of the game but the practices and habits used and their impact on the development process.

Automation also plays an integral part as an effort to unload time-consuming tasks from the developer. This should prove particularly useful for smaller independent studios with already limited resources and time.

Some practices include using test-driven development to create independent features that are easily testable, dealing with large binaries, automating release note generation and creating a workflow to automatically build and publish the game.

Blog detailing the development coming soon!

## Installation

Every version of the game can be found and downloaded under the release page on github. The instructions below detail how to install and run the game.

1. Navigate to the main github page.
2. Select [**Releases**](https://github.com/Praqma/GodotDevOps/releases) on the right side bar.
3. Choose a version you want to play.
4. Choose a zip folder for the platform you wish to run it on.
5. How to unzip and run the game vary based on platform. Continue the installation under the appropriate header.

### Windows

6. Unzip the folder.
7. Inside should be 3 files: *`NeoMori`*, *`NeoMori.pck`* and *`override.cfg`*.
8. Rename the *`NeoMori`* file (not ~~*`NeoMori.pck`*~~) to *`NeoMori.exe`*.
   - *This will be fixed in the future!*
9. That's it! To launch the game just run the .exe file.

### Linux

6. Unzip the folder.
7. Open the command line interface.
    - *The file permissions need to be modified in order to run the game*.
8. Run the following:
    ```sh
    chmod +x NeoMori
    ```
9. That's it! To launch the game just run the NeoMori file.

### Mac

6. Open the terminal.
7. Run the following:
    ```sh
    unzip "zip name"
    cd NeoMori
    unzip NeoMori
    ls -lr@
    xattr -d -r com.apple.quarantine .
    open GodotDevOps.app
    ```
8. That's it! To launch the game just run the .app file.

## Credits

- Thierry Lacour ([@praqma-thi](https://github.com/praqma-thi))
- Isak Nyström ([@SkoggsTrollet](https://github.com/SkoggsTrollet))
- Danny Darwiche ([@DannyDarwiche](https://github.com/DannyDarwiche))
- ( *Add tutorial links* )

## License

This project is licensed under the [MIT license](https://github.com/Praqma/GodotDevOps/blob/main/LICENSE).

## Project flow

### Workflow

- Code changes should be tied to an issue in [the board](https://github.com/Praqma/GodotDevOps/projects/1)
  - Reference in commit messages (`"WIP #3"`, `"Fixes #3"`)
  - Fixes that will appear in the release notes should be written directly in the commit body (`"Fixes #3 > New Feature: Giant lasers added to the players arsenal"`)
- Code changes should happen on a branch
  - Name: Related issue number, lowercase, dash-separated `3-add-giant-lasers`
- Merging is done through a pull request

### Task management

All tasks should always have a corresponding issue in [the kanban board](https://github.com/Praqma/GodotDevOps/projects/1) and all work on the project should always be attached to an issue.

The board is divided into 5 categories: Ungroomed, To Do, In Progress, Done, Scrapped.

Ungroomed tracks rough estimations of large scope issues that are usually vaguely defined.

To Do are usually born from Ungroomed issues as more clearly defined tasks that can be completed within a single workday. All To Do issues should have a clear definition of done checklist that can be assesed to determine when an issue is completed and can be merged in. The order of issues in To Do matters. Generally, issues are ordered after importance or relevance with most important on top to least important at the bottom.

In Progress are the currently worked on issues. As a rule of thumb, the amount of issues currently In Progress shouldn't surpass the amount of project members at any given time. A person can't and shouldn't work on 2 things at once. It is perfectly fine to move issues back and forth between To Do and In Progress. If an issue is larger than expected it can be broken down into smaller issues and placed in To Do.

When an issue has all its definition of done marks checked and has been merged into main it can be moved into Done. Issues in Done are generally not moved. If an issue needs revisiting, create a new one detailing the reasons why and place it in To Do.

Scrapped is a place to move issues that are no longer part of the projects scope. By placing them here instead of deleting them the scope becomes more managable. It serves as a reminder of features once considered that didn't make the cut and why. It is also useful to define a project based on both the features to include and not to include.

### GitHub Actions workflows

The build workflow is triggered either on pull requests or when pushing to main. It runs the GUT tests and if they pass it creates a build artifact of the project in its current state. The main difference between the pull request and push is determining if it is built in debug or release mode.

The publish workflow is triggered when the commit is tagged. It takes the artifact from the build workflow and publishes it as a release on GitHub.

### Creating a release

1. Open the command line interface
2. Checkout the commit the release will be based on
    - *Only works if the commit has a build artifact on main*
3. Run the shell script release.sh
4. Follow the instructions
5. The commit is now tagged with the release notes in the body. This will trigger the publish workflow which will publish the release.


### Project flow

While the actual game being developed is extremely fun and interesting, let's not forget the overlapping goal of the project. For now, let's follow this little flow for now, we can readjust at any time.

- Game development continuously ongoing
- Monday and Wednesday fikas and project discussion
- Friday demos
- During fikas and demos, we'll:
  - Find ways to improve our workflow, by either adding or removing processes/skills/tools
  - Book the time to hold some workshops/trainings to achieve those things
  - Where applicable, add them as isues to the board.
