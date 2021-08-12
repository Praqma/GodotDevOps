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

## Introduction

Hi there!
We're two game development students who had the opportunity to collaborate with [Eficode](https://www.eficode.com) over summer.

Game development is a notoriously special form of software development with many unique challenges.
However, that doesn't mean we can't learn from contemporary practices outside of the game dev world.
We did just that this summer, and this post serves as a summary of what we've learned.
We hope it can be of use to other aspiring developers and show a different aspect to game development outside of scripting, modeling and level design.

While we used [Godot](https://godotengine.org/) for our engine, we'll try to include [Unity](https://unity.com/) examples as well.

You'll find everything in our [GodotDevOps](https://github.com/Praqma/GodotDevOps) repository.

## The summer project

We set out to develop a humble indie game while learning and applying as many modern development techniques and practices as we could.
Thus we dove headfirst into test driven development (TDD), project planning, automated pipelines, etc.
These are topics we found useful but feel aren't discussed/taught often enough.

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
- [Extras](#extras)
  - [Using command line interfaces](#cli)
- [Summary](#summary)

## Getting started <a name="getting-started"></a>

These first steps detail how we set up our project repository on [GitHub](https://www.github.com).
For those unaware, GitHub is a collaboration platform offering free code hosting, task management, build automation and more.
It's a great place to organize your work both solo or as a team.

If you're tempted to skip this step, don't.
Solo developers or Dropbox enthusiasts often do and end up missing out.
Many modern practices depend on having such a repository, and it comes laden with free tooling.

Note that using GitHub goes hand in hand with using [git](git-scm.com/).
Don't let that intimidate you, though.
The benefits are absolutely worth the learning effort.

### Creating a GitHub repository <a name="repository-creation"></a>

Your repository is the heart of your project.
It's where you store your code, keep track of your work and set up your automated builds.

If you haven't created a GitHub account yet, head over to [github.com/signup](https://github.com/signup) and make one.

To create a repository, you can hit the `+` sign in the top right when logged in, or head over to [github.com/new](https://github.com/new).

**Resources**:

- [GitHub docs - Create a repo](https://docs.github.com/en/get-started/quickstart/create-a-repo)
- [Brackeys - How to use GitHub with Unity](https://www.youtube.com/watch?v=qpXxcvS-g3g)

### Inviting collaborators <a name="inviting-collaborators"></a>

If you're working as a group, you'll want to invite everyone as collaborators, so they can contribute to the repository.
This can be done in the repository's settings page, given that they have a GitHub account.

**Resources**:

- [GitHub docs - Inviting collaborators](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/managing-access-to-your-personal-repositories/inviting-collaborators-to-a-personal-repository)

### Using Git <a name="using-git"></a>

It's worth it to learn git.

We had used it before, but it often felt more of a hindrance than a help.
Admittedly, we hadn't taken the time to learn it properly.
We were just fumbling around in [GitHub Desktop](https://desktop.github.com/).

GitHub Desktop is great, mind you.
Still, we'd recommend learning to work from the command line interface (CLI).
While the app can do a lot, being able to turn to the CLI for troubleshooting will be a lifesaver.
Plus, once you know your way around the CLI, the app itself becomes a lot less arcane.

You should also pick up some good git habits.
We'll cover some in our workflow, but one bears mentioning already:
Write small commits. One change per commit is ideal.

**Resources**:

- [GitHub docs - Getting started with GitHub Desktop](https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/overview/getting-started-with-github-desktop)
- [Tom Preston-Werner - The Git Parable](https://tom.preston-werner.com/2009/05/19/the-git-parable.html)
- [Katacoda - Git Course](https://www.katacoda.com/courses/git)

### Using git LFS <a name="git-lfs"></a>

Unfortunately Git LFS does not seem to be a solution for larger projects unless you intend to purchase more storage space or host your own remote.

Installation and getting started page for Git LFS\
https://git-lfs.github.com/

## Organizing your work <a name="organizing-work"></a>

Don't get stuck on large issues. An issue shouldn't take longer than a day. If you underestimated an issue's time frame don't push through. Take a moment to break the issue down further and then continue work on one of those issues. Better to be done with one than none.

If you are unsure about how to do something, don't create an issue and begin immediate work. Instead create a spike during which you intend to find out how you implement a feature or if it is even possible. Assign it a duration and by the end of it you can more confidently create an issue on the subject if possible. When in doubt, make sure to scout.

**When working on larger projects it is important to establish a workflow that is structured and visible. This becomes increasingly more important as the project and number of collaborators grow. Games consists of a large subset of features, a lot of which can be broken into their respective subsets. It is easy to get lost in a large scope or in huge tasks that take weeks to finish.*

*Task management plays a pivotal role in how we adopt a healthy way of working. There are many ways of doing project planning but we use a simple kanban board on the GitHub page to break down our game into simple and short issues. The idea is that no issue should take longer than one workday to complete. This way you may undertake many different types of tasks instead of being stuck with one for a long period of time. There is also something gratifying about being able to mark something as done by the end of the day. Another rule of task management is that there should never be more issues in progress than the number of project members.*

### Creating a project board <a name="project-board"></a>

Our own Kanban board
https://github.com/Praqma/GodotDevOps/projects/1

### Task management <a name="task-management"></a>

### Referencing issues in your commits <a name="referencing-issues"></a>

## Creating your development workflow <a name="development-workflow"></a>

### Test Driven Development <a name="tdd"></a>

- Why TDD in game development
- Pros/cons
- When/When not to (tied to engine)
- Examples from Unity
- Examples from Godot

While it is good to test as much as possible remember that you can't isolate everything from your engine. Some of your features will need to use the engine. Use wrapper classes as an intermediary between test based classes and the engine.

One thing we never had a chance to try are play mode test. These are tests that require you to spin up the engine but allow you to test closer to it. This might be of use to you so keep it in mind.

TDD is difficult. Not just the test writing part but using it overall in a game development setting. It is a new way of developing code. It will be hard to spot when you can and can't use it. In our Godot project we didn't utilize it as much as we wanted to partly because a lot of features were tied to the engine.

```
It will take time to separate your code from the engine but it will be worth it. Long term benefits are that you can take those scripts with you into any project since they are not engine bound. It also allows you to test a lot more of your code. The more you can test the better since tests can provide quick feedback when new features break old ones.

Don't test the engine. Some features will rely upon the engine. When writing tests for them remember to not test parts of the engine. Raycasting or physics are good examples of this. Don't write tests that assert them, they have already been tested by the engine provider.
```

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

Our workflow uses rebasing and fast forward merging to get a liner history. This is just a preference. If you rather use three-way merges then absolutely go for it. Do what works for you. Just make sure that the entire team is on the same page when it comes to branching and merging and you will be good.

Branches should preferably be short lived. This lowers the risk of merge conflicts and works well with the task management where an issue should be completable in one workday.

Avoid working directly on main. You can lock pushing to main and use pull requests and merges instead.

Determine a pull request workflow. Do you create a pull request at the beginning of a branch's lifecycle? Or right before you merge it simply to run your workflows and tests? Do you assign members and actively evaluate and comment on it? These are things that need to be discussed within your team. For us, pull requests were mainly a way to run our workflow before merging with main. Since our team is very small and we are on calls when working, creating pull requests early and evaluating them felt redundant. This might not be the case for you.

You can rewrite history but this is a team effort. Force pushing changes can be detrimental if people have unfinished work on branches so make sure to carefully plan when history rewrites take place and include everyone.

## Automating work <a name="getting-automated"></a>

- GitHub actions and workflows
- Automation for Unity (Licensing issue)
- Automation (Godot)
  - Unit tests (verification)
  - Game builds for tests (verification)
  - Release notes
  - Publish
    - Dependencies (action-download-artifact@v2)

Setting up a build and publish workflow can take some time, testing and iterating. Once you have the workflow you don't have to worry about it again and you get a lot of benefits.

While working on the workflow you should try and limit the dependencies you use as much as possible. Where you are forced to or its too hard to get it working yourself, you should lock those dependencies to a specific version so that they don't update when you don't want them to.
We had a pipeline break for a day because GitHub changed something in the backend making our publish workflow not find the artifact from the build.

When using a build workflow you can easily run your tests before it builds. So that when you forget to run tests manually it still makes sure that the change you made didn't break any of the tests and cancel the action before merging it into the main. This works better the more tests and the higher code coverage you have.

This allows you to have newly updated builds that you can send out for testing. If you can include the version or commit sha that this build comes from you can then easily know where the bug reports you get comes from.

### GitHub Actions <a name="github-actions"></a>

### Continuous integration <a name="continuous-integration"></a>

Set of useful actions for Unity
Because of licensing issues we never had the chance to try them out but this includes some of the actions we were planning on using\
https://game.ci/

Container with Godot installed. Used to export project from the command line inside the container.
https://github.com/abarichello/godot-ci

Checks out GitHub repository
https://github.com/actions/checkout

### Automating releases <a name="automating-releases"></a>

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

### Automating release notes <a name="automating-release-notes"></a>

## Extras <a name="extras"></a>

### Practice Using the Command Line Interface <a name="cli"></a>

- Used heavily throughout our development
  - When making workflows and debugging them
  - Can do a lot more with git command line compared to GitHub desktop
    - Why learning Git in command line is worth it
  - Run Gut tests from CL
  - Export Godot builds from CL

## Summary <a name="summary"></a>

You might be asking yourself "Doesn't it cost more time to work this way than to just develop features for the game?". That depends on how you look at it. The first time you create your pipelines, absolutely it is going to eat up some time. Having to plan out every issue in a Kanban board instead of jumping straight into coding, that can feel cumbersome after a while too. Learning and adopting these things into your workflow does have some cost but it is all mostly frontloaded. Take the pipelines for instance. Once you got them set up, you can reuse them in any project. Never again do you have to manually run an export. TDD is another case where it can feel like it takes longer to develop features and you never really see the benefit. That probably means it is working. Your code is less prone to errors and as a result you don't have to deal with new features breaking old ones. If you are still unsure, give them a go and see if you change your mind. Our GitHub repository is a great place to start. Everything there is for you to use in your own projects. Our solutions obviously are not perfect and were developed in a way that worked for us so take our foundation and improve it. There is no one correct way on how to use these techniques. That's the beauty of it. Adopt it into your workflow and create something that works for you.

### Resources

Useful source for game development in Godot
https://www.gdquest.com/
Useful source for game development in Unity
https://www.youtube.com/c/GameDevGuide/videos
