## Full Stack Group MVC Project

### Technologies
* Spring MVC
* JPA
* MySQL
* HTML/CSS

### Overview

To wrap up the program's Java/SpringMVC/JPA materials we are going to have you build a full stack app in a group. In the workforce you will be working in groups on a daily basis, and it is good practice to learn how to contribute, plan, and communicate as part of a group.

If issues arise the instructors will be acting as project owners for this project. You are welcome to approach one of us for advice on feature issues, as well as problems regarding individuals within your team.

One member of each team will be selected to act as Scrum Master, who will:
* Make sure the team has regular [Stand-Up Scrum Meetings](https://sprint.ly/blog/scrum-meeting-best-practices/).
* Report briefly each morning to the project owners.

One team member should be responsible for managing the database - the DBA.  They will create the initial Workbench model file (in a DB or similar folder in the workspace root, implement the database design as developed by the whole team, forward engineer, and save the SQL script in the same location so teammates will get updates when they pull.

You will be given time to meet with your group and come up with an idea that fits with the project requirements. From here you must pitch the idea to the instructors. If we do not think your idea is feasible we will not allow you to move forward with the project. We are requiring all groups configure their GitHub repository as well as a Kanban, in our case Trello, on day 1.

### Requirements
Below are a list of features for your group project. The scope of the project is not limited to, but must contain these features. It is important to get the basic functionality down before moving on to the more advanced topics.

**Feature sets include:**
* A fully developed database schema. The database must be connected to your Java code using JPA.

* Our friend C.R.U.D, this time manipulating objects and saving them in an appropriate database table.

* A user log in, which is authenticated by a mySQL table. There should be different permission levels for the users, one admin that can add/update/delete content present on the site.

* A correct implementation of a session object, this can be used to track a logged in user and any changes they make (for example, a shopping cart or favorites list).

* A way to track an individual user's previous experiences on the site. For example if it is a food ordering system, a list of previous orders.

### Milestones  
##### Milestone #1: Set roles, configure tools and determine a plan. (Do this together)
* Choose roles:
  * Github repo owner
  * DBA
* (One of you) create a public Github repository and invite your teammates as collaborators.
* Create your project STS workspace initialize it with `git`, and connect it to the Github repo.
* Stub out your app's projects and their essential files.
* Push your project up to GitHub.
* Write a [README.md file](resources/projectREADME.md) for your repository ([Markdown Cheatsheet][mdcheat]) in the top-level workspace folder. Include:
  * Your names (or at least usernames).
  * The technologies you want to use.
  * Why you are building the application.
  * The methodologies you are using to build the application (group project, agile etc).
* Teammates clone the Github repo and import the projects.
* Create a [Trello][trello] board and invite your teammates to it.
* Develop user stories from the requirement and add them to your Trello icebox.
* Build a wireframe for your site together. (So that you are all on the same page -- [more info on how to do that here][wireframe])
* Slack a link to your Trello board, repository and your wireframe to your homework feedback DM channel. (This counts as submitting your proposal)

##### Milestone #2: Schema developed and tested
* Determine the relationships you will need for your database. Draw a schema that you will use for reference as you develop your application and distribute it to your team.
* Create and populate your database.
* Check that your relationships are correct with queries.
* Create a dump file to roll your database back to in the event that your lose data integrity.

##### Milestone #3: JPA mappings and config  
* Create a separate JPA project  
* Map your SQL tables to your Java entities  
* Map your relationships  
* Add your JPA project as a jar to your Gradle/Dynamic Web project's build path  
* Configure your project's `-servlet.xml` to create an entity manager, entity manager factory, and a transaction manager  

##### Milestone #4: Basic UI functionality (MVP)
* Pages are served by a SpringMVC application.
* Pages link together according to requirement.
* Data is accessed via a DAO  
* Basic styles and site architecture are present.
* Users can login.
* There are different user permission levels (one admin).
* Application is deployed to AWS.  

##### Milestone #5: Dynamic application functionality
* Content is served from a mySQL database via your Spring MVC Controller.
* You have a Dao interface and Dao class that implements it.
* Content can be created, read, updated, and deleted (CRUD) and be persisted to your database.
* Application is deployed to AWS.  

### Group Checklist
| Date | Requirement  | In Progress | Complete |
| ----------- | ----------- | ----------- | -------- |
|Day 0     | Brainstorm Idea  |   |   |   
|Day 1 PM    | Pitch Idea       |   |   |   
|Day 1 PM    | Milestone #1     |   |   |   
|Day 2   | Milestone #2     |   |   |   
|Day 3   | Milestone #3     |   |   |  
|Day 4 | Milestone #4     |   |   |  
|Day 7   | [Prepare Presentation](resources/presentation.md)  |   |   |  
|Day 8 AM   | Present Project  |   |   |  


### Expectations
Your team will be given until next Friday to complete the necessary feature sets provided to you in the project specifications. Upon completion, your team should have the updated code in a git repository (can be on team members personal github account), as well as have the project hosted on each group members AWS server. Each group will have to discuss their project in a 8 minute or less presentation touching on feature sets, issues encountered, and the overall experience. After the presentation your group will field any questions that arise. As part of your grade, we will factor in your presentation skills (practice!!), as well as look at your github logs to make sure everyone is contributing and using git appropriately for version control.

Your project's Github repo must have a completed [README.md](resources/projectREADME.md)

### Resources
We have provided you with a few write-ups to aid your team's work process. These include proper agile methodology, as well as tips on pair programming and git workflow. We have also including a [Getting Started](resources/gettingStarted.md) writeup that everyone must read individually before beginning the project.

* [Getting Started](resources/gettingStarted.md)
* [Agile](resources/agile.md)
* [Pair Programming](resources/pair_programming.md)
* [Branch Workflow](resources/git_workflow.md)  
* [MySQL Cheatsheet](resources/sqlCheatSheet.md)
* [Presentation](resources/presentation.md)
* [Project README.md](resources/projectREADME.md)

[trello]:https://trello.com/
[mdcheat]:https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
[wireframe]:https://www.codementor.io/design/tutorial/getting-started-with-wireframes
