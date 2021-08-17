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

Your git repository contains the full history of your project.
This means that every version of every texture, model, sound, etc. gets stored.
Over a long period of time, this can cause your repository to swell to an incredible size.

Git Large File Storage (LFS) is a tool that allows you to mark certain file types to be stored outside of your repository.
These files will get stored on an external file server, while your git repository will only store a lightweight reference to them.

Conveniently, GitHub offers LFS integration as well.
It works seamlessly, but it's only free up to a certain amount of storage/traffic.
Luckily, we didn't even get close to the limit with our humble 2D platformer.

If you don't want to use LFS and would rather cram your big files into your repository, you should look into [shallow clones](https://www.git-scm.com/docs/git-clone#Documentation/git-clone.txt---depthltdepthgt).
You'll need it before too long.

**Resources**:

- [git lfs - Homepage](https://git-lfs.github.com/)
- [GitHub - Managing billing for LFS](https://docs.github.com/en/billing/managing-billing-for-git-large-file-storage/about-billing-for-git-large-file-storage)
- [git-scm - Shallow clone](https://www.git-scm.com/docs/git-clone#Documentation/git-clone.txt---depthltdepthgt)

## Organizing your work <a name="organizing-work"></a>

Organizing game development is tricky, especially when you're multiple people.
Defining and improving how you organize your work is critical to a project's success.
Where good habits and discipline can do wonders, bad habits and cowboy coding can result in lots of wasted time.

We'll go into detail on how we organized our work, but there's one _very important_ thing to bring up before that:
_Your workflow is as much your product as your game._

It's a common trap for people to adopt some "best practice" workflow.
While you can certainly draw inspiration from other workflows, doing so blindly will never net you a comfortable flow.
It's vital you develop the habits and skills to continuously assess and improve your own way of working.
Start small, start simple and continuously improve.

We decided to start with a simple project board and some basic rules regarding task management.
Whenever something felt annoying or tedious in our workflow, we'd create a task to fix that.
This was an easy way of weaving process improvements into our game development.
Note that below we described what we ended up with after a few weeks, not our original starting point.

### Creating a project board <a name="project-board"></a>

Your project board is where you plan and track your work.
You could use a humble notebook, [Trello](https://trello.com) or some other tracking system.
We opted to use GitHub Projects. It has some nice features and comes with the GitHub repository.
You can create a project board from the `Projects` tab in your GitHub repository.

We'll go into detail on how we organized our board, but how you organize yours is ultimately up to you.

You'll find our board over at our [GodotDevOps](https://github.com/Praqma/GodotDevOps/projects/1) repo.

**Resources:**

- [GitHub docs - About project boards](https://docs.github.com/en/issues/organizing-your-work-with-project-boards/managing-project-boards/about-project-boards)

### Task management <a name="task-management"></a>

We organized our work by placing our tasks into various columns.
Each column has a few ground rules to keep things organized.
We ended up with: _Unrefined_, _To Do_, _In Progress_, _Done_ and _Scrapped_.
Tasks generally flow from left to right until they're done or get scrapped.

As a reminder: How you organize your tasks is up to you.
Feel free to take inspiration from us or others, but tailor it to your own needs.
Ultimately, whatever works for you is better than someone else's idea of "best practice".

#### Unrefined

This swimlane contains our vague ideas and features.
It's anything we (might) want to do at one point.

For a task to leave Unrefined, it needs to:

- **Have a clear definition of done.**
  The task has a list of criteria that need to be fulfilled before we call it "Done".
  Without this, we risk having feature creep and tasks that never get finished.
- **Be less than one day's work.**
  The task should take less than a day to complete.
  This means larger tasks should be broken up into smaller ones.
  Doing this helps set realistic task goals and prevents us from writing "Just Make The Game"-style tasks.

#### To Do

This swimlane contains all our refined tasks.
They have a clear list of things to do before they're finished and should take less than a day to complete.
Tasks are generally sorted by priority, with the most important at the top.

For convenience's sake, we also allow "Epic" tasks to exist here.
Epics represent a larger chunk of work, with references to the smaller tasks that will end up implementing it.
These are purely to help organize other tasks and are _never_ worked on directly.

Another special type of task we have are "Spike" tasks; exploratory tasks with a short time limit.
Spikes are great to gain insight on the feasibility or workload of unrefined tasks.
Spend (at most) some hours trying to implement or research an unrefined task.
You can always do another spike, so be disciplined and stick to your time limit.

For a task to leave To Do, a developer just needs to pick it up and start working on it.

#### In Progress

These are tasks currently being worked on.
There shouldn't be more tasks in progress than you have people to work on them.
No multi-tasking!

For a task to leave In Progress, its definition of done must be completed.

#### Done

These are all the tasks that are done.

Tasks never leave Done.
If something was overlooked, a new task can be created.

#### Scrapped

These are tasks that we decided against doing.

These are mostly features that didn't make the cut.
We keep them around with a comment on why they were scrapped.
In case we ever want to revisit them, or remind ourselves why we decided against them, we can find them here.

### Referencing issues in your commits <a name="referencing-issues"></a>

A good habit is to reference your issues/tasks in your commit message.
To reference an issue or task, we add the following to our commit message body:

- **WIP #12**
  Adding this means this commit is related to issue #12.
- **Fixes #12**
  Adding this means this commit is the commit that finally completes issue #12.
  Once this commit is merged into our main branch, GitHub will automatically close the issue and move it to *Done*.

Doing this makes every change in your repository link back to the issue that spawned it.
It's great for traceability and finding out why specific changes were made.
It also helps you stay disciplined and keep to your tasks.

**References:**

- [GitHub guides - Mastering Issues](https://guides.github.com/features/issues/#notifications)

## Creating your development workflow <a name="development-workflow"></a>

In this section we'll go into how we do the technical work.
Our testing and publishing work is all automated, allowing us to spend most of our time doing the fun part of game development.

Note that we didn't conjure this workflow up on day one.
Throughout the project, we constantly improved and automated our way of working.
In fact, there's still improvements we'd like to make, but we're very happy with how far we got.

Our flow is as follows:

**Development**

- Move issue from **To Do** to **In Progress**
- Create a local branch to isolate your work
- Implements the feature
  - Use TDD where applicable
  - Create small [atomic commits](https://www.aleksandrhovhannisyan.com/blog/atomic-git-commits/)
- Pushes your branch to GitHub when you're ready or taking a break

**Integration**

- Make sure your branch is up-to-date ([rebase](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) accordingly)
- Create a [Pull Request](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) for your branch
- When the automatic build pipeline finishes with success, merge and close the Pull Request.

**Release**

- Check out the commit you want to create a release for
- Run the release script, which will:
  - Prompt you for a release name
  - Generate release notes
  - Create and push a [git tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) with the release notes as its body

This will trigger the release pipeline, publishing it to our [GitHub](https://github.com/Praqma/GodotDevOps/releases) and [Itch.io](https://eficode.itch.io/neomori) pages.

### Test Driven Development <a name="tdd"></a>

Testing never gets the attention it deserves in game development.
And why would it?
It's easy to start up your game and check if things work.
But as the game grows, there will be more to test, there will more systems that can fail.
More time will be spent checking if things still work, and less on actually developing the game.
You'll want you automate your tests, but you'll find your code tightly coupled to your engine or otherwise tough to test.

This is the scenario Test Driven Development (TDD) aims to avoid.
With TDD, you write tests _before_ writing the code.
It essentially forces you to write tests _and_ testable code.

We found TDD difficult at first, especially isolating our code from the engine.
After practicing it in Unity for a while, we got the hang of it and were very happy with the results.
We regret not using it as much in our Godot project, but there just wasn't much for us to test as the engine takes care of almost everything in a 2D platformer.

Check out some of the excellent resources for getting started with TDD below.

**Resources:**

- [Infallible Code - Step by step guide on how to TDD in Unity](https://www.youtube.com/watch?v=R1aO4Tmw3zA&ab_channel=InfallibleCode)
- [Game Dev Guide - Creating Assemblies in Unity](https://www.youtube.com/watch?v=eovjb5xn8y0&ab_channel=GameDevGuide)
- [RainWare - GUT set up in Godot](https://www.youtube.com/watch?v=vBbqlfmcAlc)
- [Bitwes (Creator of GUT) - GUT tutorial](https://www.youtube.com/watch?v=nF2gPF69Dc4)
- [Official GUT documentation](https://github.com/bitwes/Gut)

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
