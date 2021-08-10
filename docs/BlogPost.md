# Ground Rules

## Subject

How to apply DevOps in a game development setting.

- Game development
  - Test driven development (Unity and Godot as examples)
    - Automated testing (continuous integration)
  - Project planning
    - Kanban board
  - Version control (Git)
    - Benefits of project planning with version control (commits connected to issues)
  - Large binaries
    - LFS
  - Continuous integration
    - GitHub actions
    - workflow
    - automated releases
    - Release note generation

## Target audience

The target is the beginner game developer or students with average experience in writing code and working in game engines. They don't have any experience working with contemporary software development techniques or how to apply these to game development.

## Goal

Encourage people to learn more about DevOps and continuous integration and apply these to their game development habits.

## Tone

Humble, laid back, not corporate. We ourselves are beginner developers reaching out to fellow beginners and want to come across as such.

-----------

# Title

# Subtitle

## Kicker

- This summer, we coached two student game developers on modern development techniques. ...
- After a summer of coaching, two game development students share ...
- ...

### Introduction

Hi there!
We're two game development students who had the opportunity to collaborate with [Eficode](https://www.eficode.com) over summer.

Game development is a notoriously special form of software development with many unique challenges.
However, that doesn't mean we can't learn from contemporary practices outside of the game dev world.
We did just that this summer, this post serves as a summary of what we've learned to help guide those interested.

### The summer project

We set out to develop a humble indie game while learning and applying as many modern development techniques and practices as we could.
Thus we dove headfirst into test driven development (TDD), project planning, automated pipelines, etc.
These are topics we found useful but feel aren't discussed/taught often enough.
We hope our experiences and notes can be of use to other aspiring developers and show a different aspect to game development outside of scripting, modeling and level design.

[Something about using this as _inspiration_ and not blindly following everything. (recap in summary)]

- [Getting started](#getting-started)
  - [Creating a GitHub repository](#repository-creation)
  - [Inviting collaborators](#inviting-collaborators)
  - [Using git](#using-git)
  - [Using git LFS](#git-lfs)
- [Organizing your work](#organizing-work)
  - [Creating a project board](#project-board)
  - [Task management](#task-management)
  - [Referencing issues in your commits](#referencing-issues)
- [Creating your development workflow](#development-workflow)
  - [Test Driven Development](#tdd)
  - [Branching and merging](#branching-and-merging)
- [Automating work](#getting-automated)
  - [GitHub Actions](#github-actions)
  - [Continuous integration](#continuous-integration)
  - [Automating releases](#automating-releases)
  - [Automating release notes](#automating-release-notes)

### Getting started <a name="getting-started"></a>

Before we can begin we need to set up our project repository on GitHub. This is necessary when collaborating with other developers, something you will likely encounter at some point working with games.

If you are a solo dev you might be tempted to skip this point. Don't. Putting your project on GitHub has a lot of benefits. You decouple your project from your machine in favor of access on any machine. Your entire project history is saved on their servers for you to look at whenever you need. A lot of the practices we'll discuss expect the project to be on GitHub.

In the following sections our experience and examples use GitHub. This is not a requirement. Any version control software can be used.

This article is written with mid sized projects in mind. If you plan on booting up your game engine of choice to build a hobby game over the weekend, then these steps are obviously overkill.

Our examples use Godot and Unity, however you can use your engine of choice. Some of the sections will need to be adapted to work with your engine.

*Links on how to create a GitHub repo for Godot or Unity projects*
#### Create a GitHub repository <a name="repository-creation"></a>

Instructions on how to create a GitHub repo\
https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/creating-a-new-repository

Guide for setting up GitHub repo with Unity project
https://www.youtube.com/watch?v=qpXxcvS-g3g&ab_channel=Brackeys

LINK MISSING: How to set up GitHub repo for Godot project\
*Find source

#### Inviting collaborators <a name="inviting-collaborators"></a>
#### Using Git <a name="using-git"></a>

Don't worry too much about making mistakes. When we started using Git one common worry was that a bad merge or commit would erase each others hard work. Because of how Git works you always have a backlog of all the changes and thus a complete project history. Besides, with proper Git habits you won't run into these issues.

The GitHub Desktop app is a fine solution to use when working with GitHub. We still recommend learning to work from the command line interface. The desktop app can do a lot but not all and being able to turn to the CLI will be a lifesaver. So learn to work with both. Understanding Git in the CLI will help you understand where a lot of features in the GitHub Desktop come from. It will also help you find new ones (honestly, the amount of times we found new things because we knew about their command line counterpart).

#### Using git LFS <a name="git-lfs"></a>

Unfortunately Git LFS does not seem to be a solution for larger projects unless you intend to purchase more storage space or host your own remote.

Installation and getting started page for Git LFS\
https://git-lfs.github.com/

### Organizing your work <a name="oraganizing-work"></a>

- Why project planning in game development
  - For collaboration projects its important to structure the development
  - Ties well into version control
- How/How not to plan a Kanban board
- Examples from Kanban board

When working on larger projects it is important to establish a workflow that is structered and visible. This becomes increasingly more important as the project and number of collaborators grow. Games consists of a large subset of features, a lot of which can be broken into their respective subsets. It is easy to get lost in a large scope or in huge tasks that take weeks to finish.

Task management plays a pivotal role in how we adopt a healthy way of working. There are many ways of doing project planning but we use a simple kanban board on the GitHub page to break down our game into simple and short issues. The idea is that no issue should take longer than one workday to complete. This way you may undertake many different types of tasks instead of being stuck with one for a long period of time. There is also something gratifying about being able to mark something as done by the end of the day. Another rule of task management is that there should never be more issues in progress than the number of project members.

#### Creating a project board <a name="project-board"></a>

Our own kanban board
https://github.com/Praqma/GodotDevOps/projects/1

#### Task management <a name="task-management"></a>
#### Referencing issues in your commits <a name="referencing-issues"></a>

### Creating your development workflow <a name="development-workflow"></a>
#### Test Driven Development <a name="tdd"></a>
- Why TDD in game development
- Pros/cons
- When/When not to (tied to engine)
- Examples from Unity
- Examples from Godot

LINK MISSING: How to write tests\
*Find source

GUT set up in Godot by Rainware\
https://www.youtube.com/watch?v=vBbqlfmcAlc

GUT tutorial by Bitwes (creator of GUT)\
https://www.youtube.com/watch?v=nF2gPF69Dc4

GUT documentation\
https://github.com/bitwes/Gut

Step by step on how to do TDD in Unity by InfallibleCode\
https://www.youtube.com/watch?v=R1aO4Tmw3zA&ab_channel=InfallibleCode

Creating assembly in Unity. Used for TDD in Unity\
https://www.youtube.com/watch?v=eovjb5xn8y0&ab_channel=GameDevGuide

#### Branching and merging <a name="branching-and-merging"></a>

https://nvie.com/posts/a-successful-git-branching-model/

### Automating work <a name="getting-automated"></a>

- GitHub actions and workflows
- Automation for Unity (Licensing issue)
- Automation (Godot)
  - Unit tests (verification)
  - Game builds for tests (verification)
  - Release notes
  - Publish
    - Dependencies (action-download-artifact@v2)

#### GitHub Actions <a name="github-actions"></a>


#### Continous integration <a name="continous-integration"></a>

Set of useful actions for Unity\
Because of licensing issues we never had the chance to try them out but this includes some of the actions we were planning on using\
https://game.ci/

Container with Godot installed. Used to export project from the command line inside the container.
https://github.com/abarichello/godot-ci

Checks out GitHub repository
https://github.com/actions/checkout

Use boolean expression to save a value\
https://github.com/haya14busa/action-cond

Uploads an artifact to the workflow\
https://github.com/actions/upload-artifact

Guide on how to release and upload artifacts with GitHub actions\
https://trstringer.com/github-actions-create-release-upload-artifacts/

Download artifact from a workflow
https://github.com/dawidd6/action-download-artifact

Upload as GitHub release\
https://github.com/softprops/action-gh-release

Upload to itch.io\
https://github.com/josephbmanley/butler-publish-itchio-action

#### Automating releases <a name="automating-releases"></a>

#### Automating release notes <a name="automating-release-notes"></a>

### Practice Using the Command Line Interface
- Used heavily throughout our development
  - When making workflows and debugging them
  - Can do a lot more with git command line compared to GitHub desktop
    - Why learning Git in command line is worth it
  - Run Gut tests from CL
  - Export Godot builds from CL

### Summary
You might be asking yourself "Doesn't it cost more time to work this way than to just develop features for the game?". That depends on how you look at it. The first time you create your pipelines, absolutely it is going to eat up some time. Having to plan out every issue in a Kanban board instead of jumping straight into coding, that can feel cumbersome after a while too. Learning and adopting these things into your workflow does have some cost but it is all mostly frontloaded. Take the pipelines for instance. Once you got them set up, you can reuse them in any project. Never again do you have to manually run an export. TDD is another case where it can feel like it takes longer to develop features and you never really see the benefit. That probably means it is working. Your code is less prone to errors and as a result you don't have to deal with new features breaking old ones. If you are still unsure, give them a go and see if you change your mind. Our GitHub repository is a great place to start. Everything there is for you to use in your own projects. Our solutions obviously are not perfect and were developed in a way that worked for us so take our foundation and improve it. There is no one correct way on how to use these techniques. That's the beauty of it. Adopt it into your workflow and create something that works for you.

### Resources
Useful source for game development in Godot
https://www.gdquest.com/
Useful source for game development in Unity
https://www.youtube.com/c/GameDevGuide/videos

### Personal Thoughts
