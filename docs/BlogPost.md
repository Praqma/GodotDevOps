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

# Blog

### Kicker
~~Are you an aspiring game developer? \
Do you struggle using TDD when writing scripts in Unity? \
Does your Git history look like the great Egyptian pyramids? \
Then we have the solution for you!~~

### Introduction

- How DevOps applies to Game Development
- 2 paragraphs
  - Start with what to expect
    - How to setup indie game project etc.
  - Personal introduction

We are two game development students who had the opportunity to collaborate with Eficode, a consultant company with a lot of experience in DevOps and continuous delivery. Over the summer we implemented various software development techniques into our game development practices. Test driven development, project planning, version control, automated pipelines, these are topics that we found useful but think aren't commonly discussed or taught. We felt that our experiences can be of use to other aspiring developers and show a different aspect to game development outside of scripting, modeling and level design.

 *(We are still beginners ourselves so keep in mind that there are be better ways to do what we have done and if you know please do share, we want to keep learning.)*

### Getting started
- How to get started creaing a game dev project
  - Creating repo
  - Inviting collaborators

### Project Planning/ Task Management
- Why project planning in game development
  - For collaboration projects its important to structure the development
  - Ties well into version control
- How/How not to plan a Kanban board
- Examples from Kanban board

### Version Control
- Why use version control in game development
- How to use it right!
  - Commit and branch habits
- How to use it right with other collaborators!
- Benefits
  - Project planning (issues)
  - Control of and access to entire history
  - Used in continuous integration

### Large Binaries
- The unique issue of large binaries like models, music, textures etc. in game development
- LFS, the possible solution
- Unfortunate reality of no "real" solution for larger projects (with minimal cost or work)

### TDD
- Why TDD in game development
- Pros/cons
- When/When not to (tied to engine)
- Examples from Unity
- Examples from Godot

### Continuous Integration
- GitHub actions and workflows
- Automation for Unity (Licensing issue)
- Automation (Godot)
  - Unit tests (verification)
  - Game builds for tests (verification)
  - Release notes
  - Publish
    - Dependencies (action-download-artifact@v2)

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

### Personal Thoughts
