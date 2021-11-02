# The novice game developers’ guide to DevOps

> The learnings of two game development students’ dip into the DevOps world

We helped two game development students explore the world of contemporary software development and DevOps.
This allowed them to simultaneously develop both:

1. a comfortable workflow
2. a sweet ninja platforming game

In this blog post they share what they’ve learned.
And now, over to the students...

## Introduction

Hi there!

We're two game development students who had the opportunity to collaborate with Eficode over the summer of 2021.

While game development is notoriously special, we can still learn from contemporary development practices used outside of it.
We set out to develop a humble game while learning and applying as many modern development techniques and practices as we could.
With the help of some Eficodeans, we dove headfirst into Test Driven Development (TDD), project planning, automated pipelines and more.

This post is a summary of what we learned.
We hope it can be of use to other aspiring game developers and show a different aspect of the development process outside of scripting, modeling and level design.
While we used Godot for our engine, our learnings apply to other engines as well.

You'll find everything in our [GodotDevOps GitHub repository](https://github.com/Praqma/GodotDevOps).

The game is also hosted on our [NeoMori itch.io page](https://eficode.itch.io/neomori).

## What we will cover

We covered many topics during the project.
In this post we’ll be as concise as possible, but feel free to skim ahead to the parts you’re interested in.

Here’s a quick overview of everything we’ll be covering:

- [Is it worth it?](#worth)
- [Getting started](#getting-started)
  - [Creating a GitHub repository](#repository-creation)
  - [Using git](#using-git)
  - [Dealing with large files in git](#git-lfs)
- [Organizing the work](#organizing-work)
  - [Creating a project board](#project-board)
  - [Task management](#task-management)
  - [Referencing issues in commits](#referencing-issues)
- [Creating a development workflow](#development-workflow)
  - [Test Driven Development](#tdd)
  - [Branching and merging](#branching-and-merging)
- [Automating work](#getting-automated)
  - [GitHub Actions](#github-actions)
  - [Continuous integration](#continuous-integration)
  - [Automating releases](#automating-releases)
  - [Automating release notes](#automating-release-notes)
- [Conclusion](#Conclusion)

## Is it worth it? <a name="worth"></a>

We had heard of many of the practices (version control, task management, Test Driven Development, etc.), but we didn't understand the payoffs of using them:

- Why spend so much time organizing and refining tasks when you can jump straight to coding?
- Why take extra time doing Test Driven Development when you can churn out more game features without it?
- Why struggle setting up automation when the tasks you're automating are trivial anyway?

At first we didn't know the answers to these questions.
We knew this was the "correct way" of working, but considered it "enterprisey" and stifling.
It all seemed like a lot of time spent not developing the game.

Even after implementing and using these practices, we didn't really notice the payoffs.
But that's because it's difficult to notice when things are missing.
We slowly realized we weren't spending as much time doing the boring or frustrating parts of development.

- By organizing and refining our tasks properly, we always had clear and concrete tasks to work on and the project never got stuck.
- By using Test Driven Development, we wasted less time chasing bugs or digging through old code.
- By setting up the automated workflows, we completely removed many mundane, boring and distracting tasks from our work.

These practices ultimately enabled us to spend more time doing the fun part: developing the game.
While it took us much time and effort to learn everything, we won't have to relearn it for our next project, and much of the automation we've done is reusable.
In hindsight, we wish we'd have learned this stuff far sooner, before our previous collaborative projects at university.

It's worth it to create a workflow that works for you, and it's worth it to learn the skills that enable you to do so.
_Your workflow is as much your product as your game._

## Getting started <a name="getting-started"></a>

The very first part of our project was creating a repository on GitHub and getting comfortable using git.

For those unaware:

- git is a version control system enabling you to save and share your work.
- GitHub is a collaboration platform offering free git repository hosting, task management, build automation and more.

If you're tempted to skip this: don't.
Many modern practices depend on using version control like git, and GitHub comes laden with free tooling.
There's a lot of bells and whistles, which can be intimidating, but don't let that stop you.
We eased into it, using only what we needed and we won't be going back to Dropbox any time soon.

### Creating a GitHub repository <a name="repository-creation"></a>

GitHub is a great place to organize your work whether you fly solo or as a team.
Before too long it'll become the heart of your project.

Creating one isn't difficult either:

- If you haven't created a GitHub account yet, head over to [github.com/signup](https://github.com/signup) to make one.
- Once signed up, you can hit the `+` sign in the top right or head over to [github.com/new](https://github.com/new) to create your repository.
- Finally, under your newly created repository's settings page, you can invite your team mates as collaborators.

**Resources:**

- [Our project repository](https://github.com/Praqma/GodotDevOps)
- [GitHub docs - Create a repo](https://docs.github.com/en/get-started/quickstart/create-a-repo)
- [GitHub docs - Inviting collaborators](https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/managing-access-to-your-personal-repositories/inviting-collaborators-to-a-personal-repository)
- [Brackeys - How to use GitHub with Unity](https://www.youtube.com/watch?v=qpXxcvS-g3g)

### Using git <a name="using-git"></a>

We had used git before, but it often felt more of a hindrance than a help.
Admittedly, we hadn't taken the time to learn it properly.
We were just fumbling around in the GitHub Desktop client.

GitHub Desktop is great, mind you.
Still, we'd recommend learning to work from the command line interface (CLI).
While the app can do a lot, being able to turn to the CLI for troubleshooting will be a lifesaver.
Plus, once you know your way around the CLI, the app itself becomes a lot less arcane.

How to use git _properly_ is a trickier subject.
Git is a popular tool with many ways of achieving similar goals, so there's a lot of opinions out there.
To avoid unnecessary confusion, we started with a very simple workflow, slowly changing it over time to suit our needs.

If you want a good tip (opinion) to get you started:
_Write small commits. One change per commit is ideal._

**Resources**:

- [GitHub docs - Getting started with GitHub Desktop](https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/overview/getting-started-with-github-desktop)
- [Tom Preston-Werner - The Git Parable](https://tom.preston-werner.com/2009/05/19/the-git-parable.html)
- [Katacoda - Git Course](https://www.katacoda.com/courses/git)

### Dealing with large files in git <a name="git-lfs"></a>

By design, a git repository contains the full history of all its contents.
This is what allows you to interact with the history even while offline.
However, storing every version of every texture, model, sound file, etc. can cause a game development repository to swell to an incredible size.

Not storing every version isn't an option, it's core to git.
Luckily there's two ways to deal with the size issue: Git LFS and shallow cloning.

Git Large File Storage (LFS) is a tool that allows you to mark certain file types to be stored outside of your repository.
These files will get stored on an external file server, while your git repository will only store a lightweight reference to them.

GitHub conveniently offers LFS integration, so we tried it out and found it working seamlessly.
Its LFS service is only free up to a certain amount of storage/traffic, but we didn't even get close to the limit with our humble 2D platformer.

If you don't want to use LFS and would rather cram your big files into your repository, you should look into [shallow cloning](https://www.git-scm.com/docs/git-clone#Documentation/git-clone.txt---depthltdepthgt).
It allows you to fetch a fragment of your repository's history, sparing you from downloading unnecessary history.

**Resources**:

- [git lfs - Homepage](https://git-lfs.github.com/)
- [GitHub - Managing billing for LFS](https://docs.github.com/en/billing/managing-billing-for-git-large-file-storage/about-billing-for-git-large-file-storage)
- [git-scm - Shallow clone](https://www.git-scm.com/docs/git-clone#Documentation/git-clone.txt---depthltdepthgt)

## Organizing the work <a name="organizing-work"></a>

We've always created project boards to organize our tasks when starting on a new game.
Without fail, these fell into disrepair and made way for cowboy coding.
They didn't provide us enough value to bother.

This time things went differently.
We were advised to start with a simple workflow, to gradually and deliberately expand on it.
We decided to start with a simple project board and some basic rules regarding task management.
Whenever something felt annoying or tedious in our workflow, we'd create a task to fix that.
The final result was a genuinely comfortable workflow which only got better over time.

Below we go into the details of our workflow.
Feel free to draw inspiration from it.
Note that what we describe below is what we ended up with after a few weeks, not our original starting point.
We highly recommend you start small, and actively work on developing it as you would your game.

### Creating a project board <a name="project-board"></a>

The project board is where you plan and track your work.
You could use a humble notebook, [Trello](https://trello.com) or some other tracking system.
We opted to use GitHub Projects. It has some nice features and comes with the GitHub repository.
You can create a project board from the `Projects` tab in your GitHub repository.

We'll go into detail on how we organized our board, but how you organize yours is ultimately up to you.

**Resources:**

- [Our project board](https://github.com/Praqma/GodotDevOps/projects/1)
- [GitHub docs - About project boards](https://docs.github.com/en/issues/organizing-your-work-with-project-boards/managing-project-boards/about-project-boards)

### Task management <a name="task-management"></a>

We organized our work by placing our tasks into various columns.
Each column has a few ground rules to keep things organized.
We ended up with: _Unrefined_, _To Do_, _In Progress_, _Done_ and _Scrapped_.
Tasks generally flow from left to right until they're done or get scrapped.

#### Unrefined

This column contains our vague ideas and features.
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

This column contains all our refined tasks.
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
No multitasking!

For a task to leave In Progress, its definition of done must be completed.

#### Done

These are all the tasks that are done.

Tasks never leave Done.
If something was overlooked, a new task can be created.
This is once more to avoid feature creep and endless tasks.

#### Scrapped

These are tasks that we decided against doing.

These are mostly features that didn't make the cut.
We keep them around with a comment on why they were scrapped.
In case we ever want to revisit them, or remind ourselves why we decided against them, we can find them here.

### Referencing issues in commits <a name="referencing-issues"></a>

A good habit is to reference issues/tasks in a commit's message.
To reference an issue or task, we add the following to our commit message body:

- **WIP #12**
  Adding this means this commit is related to issue #12.
- **Fixes #12**
  Adding this means this commit is the commit that finally completes issue #12.
  Once this commit is merged into our main branch, GitHub will automatically close the issue and move it to *Done*.
- **Fixes #12 > Added a new level**
  This behaves the same as the one above, but the extra text gets used in our [automated release notes](#automating-release-notes).
  Note that this is custom behaviour and not something that comes out of the box.

Doing this makes every change in our repository link back to the issue that spawned it.
It's great for traceability and finding out why specific changes were made.
It also helped us stay disciplined and keep to our tasks.

**Resources:**

- [GitHub guides - Mastering Issues](https://guides.github.com/features/issues/#notifications)

## Creating a development workflow <a name="development-workflow"></a>

In this section we'll go into how we do the technical work.
Our verification and publishing work is automated, allowing us to spend most of our time doing the fun part of game development.

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
- Push your branch to GitHub when you're ready or taking a break

**Integration**

- Make sure your branch is up-to-date, [rebase](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) when necessary
- Create a [Pull Request](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) for your branch
- When the automatic build pipeline finishes with success, merge and close the Pull Request.

**Release**

- Check out the commit you want to create a release for
- Run the release script, which will:
  - Prompt you for a release name
  - Generate release notes
  - Create and push a [git tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) with the release notes as its body

This will trigger the release pipeline, publishing it to our [GitHub Releases](https://github.com/Praqma/GodotDevOps/releases) and [Itch.io](https://eficode.itch.io/neomori) pages.

### Test Driven Development <a name="tdd"></a>

We never gave testing the attention it deserves, and why would we?
It's easy to boot up the game and check if things work.
But as a game grows, there's more to test and more that can fail.
That's when we'd look into adding some automated tests, but we'd made our code hard to test and tightly coupled to the engine.

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

A big part of our development workflow is how we interact with git.
Below are some of the decisions that led us to our current way of working.
Remember that these aren't the _correct_ ways to work with git, they're just what worked for us.

> We found that everyone working on the main branch turned messy quickly.<br/>
> You'd trip over unfinished work and abandoned features regularly.
> Thus we opted for people to work on their issues on separate branches.<br/>
> We enforced this by locking the main branch in our project settings.

> We found that doing too much work on a branch led to challenging merges and many merge conflicts.<br/>
> Thus we opted for working on short-lived branches that we merged as soon as the task was done.<br/>
> We enforced this by refining tasks down to small sizes.

> We found that linear history was easier to read than one with many fork/merge points.<br/>
> Thus we opted for using rebasing and fast-forward merging over the traditional three-way merges.<br/>
> We enforced this by forcing Pull Requests to be up-to-date with main in our project settings.

> We found a clean history important, but rewriting the history of our main branch to be painful.<br/>
> Thus we opted to rewrite the history of our branches to be neat _before_ we merged them in.<br/>
> We enforced this by disabling force pushing to main.

> We're a small team that collaborates mostly synchronously.<br/>
> Thus we opted to use Pull Requests purely as a platform for automated builds, rather than a place to collaborate.

As you see, there's a lot of room for preference here and much that depends on team size.
The only thing that really matters is that the team agrees on the workflow, actually follows it and is open to improving it along the way.

## Automating work <a name="getting-automated"></a>

We automated away much of the tedium in our workflow.
Running tests, building test clients, writing release notes, publishing to Itch.io, etc.
These are all things we no longer do ourselves, we've automated it.

We used GitHub Actions, the automation platform that comes with GitHub.
It's free up until a certain point, but we never hit maximum usage even when some builds got stuck for hours.

Setting up your first build can be a daunting task, but don't give up!
It's a great skill to learn.

We'll go into detail on our builds, but there's some learnings we'd like to share first:

- **Learn some basic shell scripting and RegEx**.
  It can turn minor automation tasks into trivial work.
- **Limit your reliance on pre-built Actions**.
  Pre-built actions are opaque and can't be run locally.
  A short script is preferable.
- **Keep it simple, start small**.
  It's easy to go overboard and make very intelligent automation.
  You'll spend a lot of time making something brittle and hard to maintain.

**Resources**:

- [regex101 - RegEx Playground](https://regex101.com/)

### GitHub Actions <a name="github-actions"></a>

With GitHub Actions you define workflows in dedicated configuration files.
A workflow consists of an event that triggers it, an environment it runs in and steps it executes.
An example workflow could be: "When a Pull Request gets a new change, spin up a Ubuntu environment with Godot and run my unit tests."

It took us a while to get used to the concepts and syntax.
Once we did, we set up two workflows: one for building and testing, another for publishing releases.
Getting it all working proved frustrating at times, but it was well worth it:

- We've really come to appreciate always having up-to-date clients available.
- The tests prevented us from merging in botched branches multiple times.
- Creating releases was hassle-free.

It was just very pleasant having all this automated.
We'll go over our workflows below, hopefully you can draw some inspiration from them.

**Resources:**

- [Isaac Broyles - Building Unity with GitHub Actions](https://isaacbroyles.com/gamedev/2020/07/04/unity-github-actions.html)
- [Thomas Stringer - Create a Release and Upload Artifacts with GitHub Actions](https://trstringer.com/github-actions-create-release-upload-artifacts/)

### Continuous integration <a name="continuous-integration"></a>

Our first workflow was one to build and test our latest changes.
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

1. Get the relevant code using the pre-built [checkout action](https://github.com/actions/checkout).
  We use `lfs: true` to get our LFS files, and `fetch-depth: 0` to get our entire history as we'll need it later.
2. Choose between building a debug or release client using the [Conditional value](https://github.com/haya14busa/action-cond) action.
  We were a bit surprised it wasn't trivial to get a conditional value, but here we are.
3. Use the [godot command line interface](https://docs.godotengine.org/en/stable/getting_started/editor/command_line_tutorial.html) to run GUT and export the client.
4. Upload the game clients as build artifacts using the pre-built [upload-artifact](https://github.com/actions/upload-artifact) action.
That's it, automated tests and builds are up and running!

**On embedding the version:**

We wanted to display the version in the game's main menu.
However, we didn't want to (forget to) manually update the label every time.

We learned we can override [Godot project settings](https://docs.godotengine.org/en/stable/classes/class_projectsettings.html#class-projectsettings) using an `override.cfg` file, even after building the game. Instead of using a hardcoded value, we store the version in a project setting and render that. Then we use [git tags](https://git-scm.com/book/en/v2/Git-Basics-Tagging) and [git describe](https://git-scm.com/docs/git-describe) to determine the version at build time and generate the `override.cfg` then and there.

Is it clever? Yes.
Too clever? Maybe.
Do we like it? Absolutely!

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

Our first step is to use the [dawidd6/action-download-artifact](https://github.com/dawidd6/action-download-artifact) action to download the clients we've already built in our build workflow. This way we avoid a redundant build and ensures the client we're releasing is the one we've been play-testing.

Then we zip up the client and use the [softprops/action-gh-release](https://github.com/softprops/action-gh-release) action to publish it as a GitHub release. Making them available on our [Releases page](https://github.com/Praqma/GodotDevOps/releases).

Finally, we use the [josephbmanley/butler-publish-itchio-action](https://github.com/josephbmanley/butler-publish-itchio-action) action to publish it to our [itch.io page](https://eficode.itch.io/neomori).

**On embedding the version:**

You'll notice part of our release workflow is dedicated to updating the `override.cfg` file we created in the build workflow.
Using the `GITHUB_REF` environment variable provided by GitHub, we're only a few RegEx replacements away from updating the version in our main menu:

```yaml
- name: Set version
  run: echo "VERSION=${GITHUB_REF/refs\/tags\//}" >> $GITHUB_ENV

- name: Update global/version in override.cfg
  run: sed -i "s#global/version\s*=.*#global/version=\"${{ env.VERSION }}\"#g" NeoMori/override.cfg
```

### Automating release notes <a name="automating-release-notes"></a>

While working on our release workflow, we realized we had everything in place to automate our release notes:

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
It's all pretty simple, but it gets the job done and saves us a lot of work.

## Conclusion <a name="conclusion"></a>

That’s it. We already knew being more organized and disciplined would make development easier.
Our big mistake was thinking it would also make it _less fun_.
It enables you to get rid of the unfun things through automation.
So if you're having trouble staying disciplined, try automating some things to make it all the more enticing.

Ultimately, we've learned a lot from our dive into contemporary development practices.
It has enabled us to make our projects more sustainable, organized and free of much of the tedium.
While we often struggled to get everything working or while developing good habits, it was worth it in the end.

In hindsight, we've wasted a lot of time by not learning these things sooner.
