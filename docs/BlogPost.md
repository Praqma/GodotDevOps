# Title

# Subtitle

## Kicker

- This summer, we coached two student game developers on modern development techniques. ...
- After a summer of coaching, two game development students share ...
- ...

## Introduction

Hi there!
We're two game development students who had the opportunity to collaborate with [Eficode](https://www.eficode.com) over summer.

While game development is notoriously special, we can still learn from contemporary development practices used outside of it.
We set out to develop a humble game while learning and applying as many modern development techniques and practices as we could.
With the help of some Eficodeans, we dove headfirst into Test Driven Development (TDD), project planning, automated pipelines and more.

This post serves as a summary of our learnings.
We hope it can be of use to other aspiring game developers and show a different aspect of the development process outside of scripting, modeling and level design.

You'll find everything in our [GodotDevOps GitHub repository](https://github.com/Praqma/GodotDevOps).

The game is also hosted on our [NeoMori itch.io page](https://eficode.itch.io/neomori).

While we used [Godot](https://godotengine.org/) for our engine, we'll try to include [Unity](https://unity.com/) examples as well.

## Table of contents

[Something to introduce the TOC]
[Something about using this as _inspiration_ and not blindly following everything. (recap in summary)]

- [Is it worth it?](#worth)
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
- [Conclusion](#Conclusion)

## Is it worth it? <a name="worth"></a>

Before we dip into technical details, we wanted to share if and how learning all of this was worth it.

We had heard of many of the practices (version control, task management, Test Driven Development, etc.), but we didn't understand of the payoffs of using them:

- Why spend so much time organizing and refining tasks when you can jump straight to coding?
- Why take extra time doing Test Driven Development when you can churn out more game features without it?
- Why struggle setting up automation when the tasks you're automating are trivial anyway?

Going into the project, we didn't really know the answers to these questions.
We knew these were the "correct way" of working, but considered them "enterprisey" and stifling.
It all seemed like a lot of time spent not developing the game.

Even after implementing and using these practices, we didn't really notice the payoffs.
But that's because it's difficult to notice when things are _missing_.
We slowly realized we weren't spending as much time doing the boring or frustrating parts of development.

- By organizing and refining our tasks properly, we always had clear and concrete tasks to work on and the project never got stuck.
- By using Test Driven Development, we wasted less time chasing bugs or digging through old code.
- By setting up the automated workflows, we completely removed many mundane, boring and distracting tasks from our work.

These practices ultimately enabled us to spend _more_ time doing the fun part: developing the game.
While it took us much time and effort to learn everything, we won't have to relearn it for our next project, and much of the automation we've done is reusable.
In hindsight, we wish we'd have learned this stuff far sooner, before our previous collaborative projects.

It's worth it to create a workflow that works for you, and it's worth it to learn the skills that enable you to do so.

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

For a task to leave To Do, a developer only needs to pick it up and start working on it.

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

A big part of your development workflow is how you interact with your version control system.
There's a lot to consider when it comes to defining that flow.
Below are some of the decisions that led us to our current way of working.
Remember that these aren't the _correct_ ways to work with git, they're just what worked for us.

> We found that everyone working on the main branch turned messy quickly.<br/>
> Thus we opted for people to work on their issues on separate branches.<br/>
> We enforced this by locking the main branch in our project settings.

> We found that long-lived branches led to challenging merges and many merge conflicts.<br/>
> Thus we opted for working on short-lived branches that we merged as soon as the task was done.<br/>
> We enforced this by refining tasks down to small sizes.

> We found that linear history was easier to read.<br/>
> Thus we opted for using rebasing and fast-forward merging over the traditional three-way merges.<br/>
> We enforced this by forcing Pull Requests to be up-to-date with main in our project settings.

> We found a clean history important, but rewriting the history of our main branch to be painful.<br/>
> Thus we opted to rewrite the history of our branches to be neat _before_ we merged them in.<br/>
> We enforced this by disabling force pushing to main.

> We're a small team that collaborates mostly synchronously.<br/>
> Thus we opted to use Pull Requests purely as a platform for automated builds, rather than a place to collaborate.

As you see, there's a lot of room for preference here and much that depends on your team size.
The only thing that really matters is that your team agrees on the workflow, actually follows it and is open to improving it along the way.

## Automating work <a name="getting-automated"></a>

We automated away much of the tedium in our workflow.
Running tests, building test clients, writing release notes, publishing to Itch.io, etc.
These are all things we no longer do ourselves, we've automated it.

We used GitHub Actions, the automation platform that comes with GitHub.
It's free up until a certain point, but we never hit maximum usage even when some builds got stuck for hours.

Setting up your first build can be a daunting task.
Don't give up!
It's a great skill to learn.

We'll go into detail on our builds, but there's definitely some learnings we'd like to share first:

- **Learn some basic shell scripting and RegEx**.
  They can make minor automation trivial work.
- **Limit your reliance on pre-built Actions**.
  Pre-built actions are opaque and can't be run locally.
  A short script is preferable.
- **Keep it simple, start small**.
  It's easy to go overboard and make very intelligent automation.
  You'll spend a lot of time making something brittle and hard to maintain.

**Resources**:

- *TODO: shell intro*
- *TODO: regex intro*
- [regex101 - RegEx Playground](https://regex101.com/)

### GitHub Actions <a name="github-actions"></a>

With GitHub Actions you define your workflows in dedicated configuration files.
These workflows consist of an event they trigger on, an environment they run in and the steps they execute.
An example workflow would be: "When a Pull Request gets a new change, spin up a Ubuntu environment with Godot and run my GUT tests."

It took us a while to get used to the concepts and syntax.
Once we did, we set up two workflows: one for building and testing, another for publishing a release.
Getting it all working proved frustrating at times, but it was well worth it.

We've really come to appreciate always having up-to-date clients available.
The tests prevented us from merging in botched commits.
Releasing was hassle-free.
It was just very pleasant having all this automated.

We'll go over our workflows below, hopefully you can draw some inspiration from them.

**Resources:**

- [Isaac Broyles - Building Unity with GitHub Actions](https://isaacbroyles.com/gamedev/2020/07/04/unity-github-actions.html)
- [Thomas Stringer - Create a Release and Upload Artifacts with GitHub Actions](https://trstringer.com/github-actions-create-release-upload-artifacts/)

### Continuous integration <a name="continuous-integration"></a>

Our first workflow was one to build and test our newest changes.
It lives in the [.github/workflows/build.yml](https://github.com/Praqma/GodotDevOps/blob/main/.github/workflows/build.yml) file.

#### Trigger

This job is triggered:

- on commits to main
- on commits to Pull Requests to main
- manually

```yaml
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
  workflow_dispatch:
```

#### Environments

The workflow is divided into three jobs, one for each platform (Windows/Linux/Mac).
These run in parallel in their own environment.

The environments themselves are Ubuntu environments with Godot available.
The image for the environment is maintained over at [github.com/abarichello/godot-ci](https://github.com/abarichello/godot-ci).

```yaml
runs-on: ubuntu-latest
container:
  image: barichello/godot-ci:3.3.2
```

Early on, we only used `ubuntu-latest` and not the `godot-ci` image.
We used pre-built Actions to [build](https://github.com/marketplace/actions/build-godot) and [test](https://github.com/marketplace/actions/run-gut-tests) our project.
We prefer our current solution as the steps are more transparent than the pre-built actions.

#### Steps

The steps differ slightly between target platforms, but they all follow the same trend.

- First, we get the relevant code using the pre-built [https://github.com/actions/checkout](checkout action).
  We use `lfs: true` to get our LFS files, and `fetch-depth: 0` to get our entire history as we'll need it later.
- Then we pick between a building a debug or release client using the [Conditional value](https://github.com/haya14busa/action-cond) action.
  We were a bit surprised it wasn't trivial to get a conditional value, but here we are.
- Then we use the [godot command line interface](https://docs.godotengine.org/en/stable/getting_started/editor/command_line_tutorial.html) to run GUT and export the client.
- Finally, we upload the game clients as build artifacts using the pre-built [upload-artifact](https://github.com/actions/upload-artifact) action.
That's it, automated tests and builds are up and running!

**On embedding the version:**

We wanted to display the version in the game's main menu.
However, we didn't want to (forget to) manually update the label every time.

We learned we can override [Godot project settings](https://docs.godotengine.org/en/stable/classes/class_projectsettings.html#class-projectsettings) using an `override.cfg` file, even after building the game. Instead of using a hardcoded value, we store the version in a project setting and render that. Then we use [git tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging) and [git describe](https://git-scm.com/docs/git-describe) to determine the version at build time and generate the `override.cfg` then and there.

Is it clever? Yes.
Too clever? Maybe.
Do we like it? Absolutely.

```yaml
- name: Get version using git describe
  run: echo "GIT_DESCRIBE=$(git describe)" >> $GITHUB_ENV

- name: Create override.cfg
  if: ${{ env.GIT_DESCRIBE != '' }}
  run: echo "global/version = \"$GIT_DESCRIBE\"" >> override.cfg

- name: Upload override.cfg
  if: ${{ env.GIT_DESCRIBE != '' }}
  uses: actions/upload-artifact@v2
  with:
    name: NeoMori-${{ github.sha }}-${{ github.job }}
    path: ${{ github.workspace }}/override.cfg
```

### Automating releases <a name="automating-releases"></a>

Our second workflow was automating our release process.
You'll find the workflow YAML file in [.github/workflows/publish.yml](https://github.com/Praqma/GodotDevOps/blob/main/.github/workflows/publish.yml).

#### Trigger

To trigger our release workflows, we simply push a [git tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging).
This will kick off the pipeline for the commit we tagged.

```yaml
on:
  push:
    tags:
      - '*'
```

#### Environments

Our release workflow's pretty lightweight with few requirements, so `ubuntu-latest` works fine:

```yaml
runs-on: ubuntu-latest
```

#### Steps

Unlike the build workflows, the release workflow is identical for Windows, Linux and Mac.
Thus we made it a [matrix workflow](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idstrategymatrix), allowing us to define three near-identical workflows without duplication.

Our fist step is to use the [dawidd6/action-download-artifact](https://github.com/dawidd6/action-download-artifact) action to download the clients we've already built in our build workflow. This way we avoid a redundant build and ensures the client we're releasing is the one we've been play-testing.

Then we zip up the client and use the [softprops/action-gh-release](https://github.com/softprops/action-gh-release) action to publish it as a GitHub release. Making them available on our [Releases page](https://github.com/Praqma/GodotDevOps/releases).

Finally, we use the [josephbmanley/butler-publish-itchio-action](https://github.com/josephbmanley/butler-publish-itchio-action) action to publish it to our [itch.io page](https://eficode.itch.io/neomori).

**On embedding the version:**

You'll notice part of our release workflow is dedicated to updating the `override.cfg` file we created in the build workflow.
Using the `GITHUB_REF` environment variable provided by GitHub, we're only a few RegEx replaces away from updating the version in our main menu:

```yaml
- name: Set version
  run: echo "VERSION=${GITHUB_REF/refs\/tags\//}" >> $GITHUB_ENV

- name: Update global/version in override.cfg
  run: sed -i "s#global/version\s*=.*#global/version=\"${{ env.VERSION }}\"#g" NeoMori/override.cfg
```

### Automating release notes <a name="automating-release-notes"></a>

While working on our release workflow, we realized we had two pieces in place that would allow us to automate our release notes:

- **We tag our releases.**
  Combining `git describe` and `git log`, we can easily get a list of commits made since the last release.
- **We reference issues in our commits.**
  We can tell by a commit's message what issue was worked on/completed.

Our first idea was to:

- Use `git describe` and `git log` to get a list of commits since the last release.
- Use RegEx to get a list of all the completed issues from those commits.
- Get the titles of the issues through the [GitHub Issues API](https://docs.github.com/en/rest/reference/issues#get-an-issue).
- Format the titles into neat release notes.

A basic but sound approach.
However, there were two few minor things that bothered us:

- Not all issues are interesting enough to make it to the release notes
- Issue titles aren't the greatest release note entries

So we decided to simplify it even further:

- _If_ we want an issue to be added to the release notes, we slightly modify how we reference it in our commit message.
- While we're at it, we write the release note entry in the commit message.

Here's an example commit message:

```text
Clean up remaining placeholder assets

Fixes #137 > New Feature: Graphics and animations have been updated
```

Which will end up as `- New Feature: Graphics and animations have been updated (#137)` in the release notes.

The magic happens in our release note generation script ([.buildscripts/release-notes.sh](https://github.com/Praqma/GodotDevOps/blob/main/.buildscripts/release-notes.sh)). It's a simple concatenation of `git log`, a RegEx find/replace and a sort.

When we tag a commit to make a release, we use the output of the script as the tag's body.
That way our GitHub Release immediately has patch notes attached, as it defaults to the tag body for its message.
It's all pretty siple, but it gets the job done and saves us a lot of work.

## Extras <a name="extras"></a>

### Practice Using the Command Line Interface <a name="cli"></a>

- Used heavily throughout our development
  - When making workflows and debugging them
  - Can do a lot more with git command line compared to GitHub desktop
    - Why learning Git in command line is worth it
  - Run Gut tests from CL
  - Export Godot builds from CL

## Conclusion <a name="conclusion"></a>

[quick wrap-up, point to things we didn't get a chance to do]
