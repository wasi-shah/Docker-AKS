# Key concepts for new Azure Pipelines

Azure Pipelines automatically builds and tests code projects. It supports all major languages and project types and combines continuous integration, continuous delivery, and continuous testing to build, test, and deliver your code to any destination.

## Continuous Integration
Continuous Integration (CI) is the practice used by development teams of automating, merging, and testing code. CI helps to catch bugs early in the development cycle, which makes them less expensive to fix. Automated tests execute as part of the CI process to ensure quality. 
- Increase code coverage
- Build faster by splitting test and build runs
- Automatically ensure you don't ship broken code
- Run tests continually

> [!Note]
> CI systems produce artifacts and feed them to release processes to drive frequent deployments.


## Continuous Delivery
Continuous Delivery (CD) is a process by which code is built, tested, and deployed to one or more test and production environments. Deploying and testing in multiple environments increases quality. - CD systems produce deployable artifacts, including infrastructure and apps. 
- Automated release processes consume these artifacts to release new versions and fixes to existing systems.
- Systems that monitor and send alerts run continually to drive visibility into the entire CD process.
- Automatically deploy code to production
- Ensure deployment targets have latest code
- Use tested code from CI process

## Continuous Testing
Whether your app is on-premises or in the cloud, you can automate build-deploy-test workflows and choose the technologies and frameworks. Then, you can test your changes continuously in a fast, scalable, and efficient manner

> [!Note]
> Continuous testing with Azure DevOps Server ensures your app still works after every check-in and build, enabling you to find problems earlier by running tests automatically with each build.

## Pricing for Azure DevOps
If you use public projects, Azure Pipelines is free, but you will need to request the free grant of parallel jobs. 

If you use private projects, you can run up to 1,800 minutes (30 hours) of pipeline jobs for free every month.

> [!Note]
> You can use your custom agent to have unlimited pipeline jobs execution time.



- Pipelines are made of stages, jobs and steps.
- A pipeline can deploy to one or more environments.
- A Pipeline response to a automatic or manual trigger
 - A trigger can be a 
   - Manual trigger 
   - Push to a Repo
   - Scheduled time
   - After another build finished

## Pipeline Hierarchy 
Pipelines are made of stages, jobs and steps.

- Pipeline > Stage - A stage is a way to logically divide your pipeline
  - A stage is a logical boundary in the pipeline.
  - It can be used to mark the separation of concerns (for example, Build, QA, and production).
  - For example, you could have a stage for Build, Test and Deploy
  - Inside each stage is one or more jobs
  - a stage can depend on another stage

- Pipeline > Stage > Job - Each job runs on one agent. A job can also be agentless.
  - A job can attached to a custom agent 
  - A job can also be an agent less for example a 30 seconds delay.
  - A job represents an execution boundary of a set of steps.
  - A job is a collection of steps run by an agent on a server or client custom host machine.

- Pipeline > Stage > Job > Step/Tasks - A step can be a task or script and is the smallest building block of a pipeline.
  - For example: A test can be
    - A Task is a pre-packaged script that performs an action
    - All of the steps run together on the same agent. 
    - Build artifact 
    - Publish artifact 
    - Invoke an API  

A typical pipeline hierarchy 
![image](https://github.com/wasi-shah/Docker-AKS/assets/51749920/34356325-ac1e-4e2f-93cd-c93d6710c39a)

```

- Pipeline
  - Stages
    - Stage : Build
        - Jobs
            - Job 1
                - Steps
                    - script: "Do test work"
                    - Task 1
                    - Task 2

```
> [!important]
> Simple pipelines don't require all of these levels. For example, in a single-job build, you can omit the containers for stages and jobs because there are only steps. And because many options shown in this article aren't required and have good defaults, your YAML definitions are unlikely to include all of them.

If you have a single stage, you can omit the stages keyword and directly specify the jobs keyword:
```
# ... other pipeline-level keywords
jobs: [ job | template ]
```

If you have a single stage and a single job, you can omit the stages and jobs keywords and directly specify the steps keyword:
```
# ... other pipeline-level keywords
steps: [ script | bash | pwsh | powershell | checkout | task | template | ... ]
```
A typical pipeline file with stages
```
stages: [ stage | template ] # Required. Stages are groups of jobs that can run without human intervention.
pool: string | pool # Pool where jobs in this pipeline will run unless otherwise specified.
name: string # Pipeline run number.
appendCommitMessageToRunName: boolean # Append the commit message to the build number. The default is true.
trigger: none | trigger | [ string ] # Continuous integration triggers.
parameters: [ parameter ] # Pipeline template parameters.
pr: none | pr | [ string ] # Pull request triggers.
schedules: [ cron ] # Scheduled triggers.
resources: # Containers and repositories used in the build.
  builds: [ build ] # List of build resources referenced by the pipeline.
  containers: [ container ] # List of container images.
  pipelines: [ pipeline ] # List of pipeline resources.
  repositories: [ repository ] # List of repository resources.
  webhooks: [ webhook ] # List of webhooks.
  packages: [ package ] # List of package resources.
variables: variables | [ variable ] # Variables for this pipeline.
lockBehavior: string # Behavior lock requests from this stage should exhibit in relation to other exclusive lock requests.
``` 
Example pipeline
```
trigger:
- main

pool: 
  vmImage: ubuntu-latest

stages:
- stage: CI
  jobs:
  - job: CIWork
    steps:
    - script: "Do CI work"

- stage: Test
  jobs:
  - job: TestWork
    steps:
    - script: "Do test work"
    
```
### paths: specific path build
You can specify trigger, branch, file paths to include or exclude.

Wilds cards are supported for path filters. For instance, you can include all paths that match src/app/**/myapp*. You can use wild card characters (**, *, or ?) when specifying path filters.


- Paths are always specified relative to the root of the repository.
- If you don't set path filters, then the root folder of the repo is implicitly included by default.
- If you exclude a path, you cannot also include it unless you qualify it to a deeper folder. For example if you exclude /tools then you could include /tools/trigger-runs-on-these
- The order of path filters doesn't matter.
Paths in Git are case-sensitive. Be sure to use the same case as the real folders.
You cannot use variables in paths, as variables are evaluated at runtime (after the trigger has fired).

```
# specific path build
trigger:
  branches:
    include:
    - main
    - releases/*
  paths:
    include:
    - docs
    exclude:
    - docs/README.md
    
```
## Run
A run represents one execution of a pipeline. It collects the logs associated with running the steps and the results of running tests. During a run, Azure Pipelines will first process the pipeline and then send the run to one or more agents.

## Artifact
An artifact is a collection of files or packages published by a run.

## Agent
When your build or deployment runs, the system begins one or more jobs. An agent is computing infrastructure with installed agent software that runs one job at a time. For example, your job could run on a Microsoft-hosted Ubuntu agent or your own hosted custom agent.

## Environment
An environment is a collection of resources where you deploy your application. One environment can contain one or more virtual machines, containers, web apps, or any service. Pipelines deploy to one or more environments after a build is completed and tests are run.


# Parameters
Unlike variables, pipeline parameters can't be changed by a pipeline while it's running.

Parameters are only available at template parsing time. Parameters are expanded just before the pipeline runs so that values surrounded by ${{ }} are replaced with parameter values. 
> [!note]
> Use variables if you need your values to be more widely available during your pipeline run.

> [!important]
> Parameters must contain a name and data type. Parameters can't be optional. A default value needs to be assigned in your YAML file or when you run your pipeline. If you don't assign a default value or set default to false, the first available value is used.

> [!important]
> use ${{ parameter.name }} to display parameters for example ${{ parameters.image }}

## Using parameter in pipeline Yaml
```
parameters:
- name: image
  displayName: Pool Image
  type: string
  default: ubuntu-latest
  values:
  - windows-latest
  - ubuntu-latest
  - macOS-latest

trigger: none

jobs:
- job: build
  displayName: build
  pool: 
    vmImage: ${{ parameters.image }}
  steps:
  - script: echo building $(Build.BuildNumber) with ${{ parameters.image }}
```

When the pipeline runs, you select the Pool Image. If you don't make a selection, the default option, ubuntu-latest gets used.

## Use conditionals with parameters
You can also use parameters as part of conditional logic. With conditionals, part of a YAML runs if it meets the if criteria.
```
parameters:
- name: configs
  type: string
  default: 'x86,x64'

trigger: none

jobs:
- ${{ if contains(parameters.configs, 'x86') }}:
  - job: x86
    steps:
    - script: echo Building x86...
- ${{ if contains(parameters.configs, 'x64') }}:
  - job: x64
    steps:
    - script: echo Building x64...
- ${{ if contains(parameters.configs, 'arm') }}:
  - job: arm
    steps:
    - script: echo Building arm...
```


# Variables 
There are three types of variables flows in the pipeline
1. User-defined Variables
2. System variables
3. Environment variables


## User-defined Variables
Variables give you a convenient way to get key bits of data into various parts of the pipeline. The most common use of variables is to define a value that you can then use in your pipeline. All variables are strings and are mutable. 

> [!Note]
> The value of a variable can change from run to run or job to job of your pipeline.

### Variable scopes
In the YAML file, you can set a variable at various scopes:

- You can also specify variables outside of a YAML pipeline in the UI. When you set a variable in the UI, that variable can be encrypted and set as secret.
- At the root level, to make it available to all jobs in the pipeline.
- At the stage level, to make it available only to a specific stage.
- At the job level, to make it available only to a specific job.

> [!Note]
> Variables at the job level override variables at the root and stage level. Variables at the stage level override variables at the root level.
> When you define the same variable in multiple places with the same name, the most locally scoped variable wins. So, 
> - a variable defined at the job level can override a variable set at the stage level. 
> - A variable defined at the stage level overrides a variable set at the pipeline root level. 
> - A variable set in the pipeline root level overrides a variable set in the Pipeline settings UI. 

```
variables:
  global_variable: value    # this is available to all jobs

jobs:
- job: job1
  pool:
    vmImage: 'ubuntu-latest'
  variables:
    job_variable1: value1    # this is only available in job1
  steps:
  - bash: echo $(global_variable)
  - bash: echo $(job_variable1)
  - bash: echo $JOB_VARIABLE1 # variables are available in the script environment too

- job: job2
  pool:
    vmImage: 'ubuntu-latest'
  variables:
    job_variable2: value2    # this is only available in job2
  steps:
  - bash: echo $(global_variable)
  - bash: echo $(job_variable2)
  - bash: echo $GLOBAL_VARIABLE
  ```

  Output
  ```
# job1
value 
value1
value1

# job2
value
value2
value
  ```

### How to use variables in Bash, PowerShell, and a script task
> [!note]
> - bash: echo $(projectName)
> - powershell: echo $(projectName)
> - script: echo $(projectName)

```
variables:
 - name: projectName
   value: contoso

steps: 
- bash: echo $(projectName)
- powershell: echo $(projectName)
- script: echo $(projectName)
```

### Variable groups and templates

#### Variable groups
Variable groups are a set of variables that you can use across multiple pipelines. They allow you to manage and organize variables that are common to various stages in one place.

#### Variable templates
With templates, variables can be defined in one YAML and included in another YAML file.
Use templates to define variables in one file that are used in multiple pipelines.


Sample using variables, group and templates
```
variables:
# a regular variable
- name: myvariable
  value: myvalue
# a variable group
- group: myvariablegroup
# a reference to a variable template
- template: build.yml
```
build.yml
```
variables:
- name: vmImage
  value: vs2017-win2016
- name: arch
  value: x64
- name: config
  value: debug
```

### Share variables across pipelines
Some tasks define output variables, which you can consume in downstream steps, jobs, and stages. In YAML, you can access variables across jobs and stages by using dependencies.

Dependency syntax overview
The syntax of referencing output variables with dependencies varies depending on the circumstances. Here's an overview of the most common scenarios. Note that there may be times when alternate syntax also works.

- stage to stage dependency (different stages)
  - stageDependencies.<stage-name>.outputs['<job-name>.<step-name>.<variable-name>']
- job to job dependency (same stage)
  - dependencies.<stage-name>.outputs['<step-name>.<variable-name>']
- Job to stage dependency (different stages)
  - stageDependencies.<stage-name>.<job-name>.outputs['<step-name>.<variable-name>']
- Stage to stage dependency (deployment job)
  - dependencies.<stage-name>.outputs['<deployment-job-name>.<deployment-job-name>.<step-name>.<variable-name>']
- Stage to stage dependency (deployment job with resource)
  - dependencies.<stage-name>.outputs['<deployment-job-name>.<Deploy_resource-name>.<step-name>.<variable-name>']

### Use outputs in the same job      
```
steps:
- task: MyTask@1  # this step generates the output variable
  name: ProduceVar  # because we're going to depend on it, we need to name the step
- script: echo $(ProduceVar.MyVar) # this step uses the output variable
```

### Use outputs in a different job
> [!note]
> $[ dependencies.A.outputs['ProduceVar.MyVar'] ]
```
jobs:
- job: A
  steps:
  # assume that MyTask generates an output variable called "MyVar"
  # (you would learn that from the task's documentation)
  - task: MyTask@1
    name: ProduceVar  # because we're going to depend on it, we need to name the step
- job: B
  dependsOn: A
  variables:
    # map the output variable from A into this job
    varFromA: $[ dependencies.A.outputs['ProduceVar.MyVar'] ]
  steps:
  - script: echo $(varFromA) # this step uses the mapped-in variable
```
### Use outputs in a different stage
> [!note]
> stageDependencies.STAGE.JOB.outputs['TASK.VARIABLE']
```
stages:
- stage: One
  jobs:
  - job: A
    steps:
    - task: MyTask@1  # this step generates the output variable
      name: ProduceVar  # because we're going to depend on it, we need to name the step

- stage: Two
  dependsOn:
  - One
  jobs:
  - job: B
    variables:
      # map the output variable from A into this job
      varFromA: $[ stageDependencies.One.A.outputs['ProduceVar.MyVar'] ]
    steps:
    - script: echo $(varFromA) # this step uses the mapped-in variable

- stage: Three
  dependsOn:
  - One
  - Two
  jobs:
  - job: C
    variables:
      # map the output variable from A into this job
      varFromA: $[ stageDependencies.One.A.outputs['ProduceVar.MyVar'] ]
    steps:
    - script: echo $(varFromA) # this step uses the mapped-in variable
```

## System variables
In addition to user-defined variables, Azure Pipelines has system variables with predefined values. For example, the predefined variable Build.BuildId gives the ID of each build and can be used to identify different pipeline runs. You can use the Build.BuildId variable in scripts or tasks when you need to a unique value.

https://learn.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml


If you're using classic release pipelines, see release variables.

System variables get set with their current value when you run the pipeline. Some variables are set automatically. As a pipeline author or end user, you change the value of a system variable before the pipeline runs.

System variables are read-only.

```
  - script: |
      echo "Pipeline Information:"
      echo "---------------------"
      echo "Azure DevOps Organization: $(System.CollectionUri)"
      echo "Azure DevOps Project: $(System.TeamProject)"
      echo "Pipeline Triggered By: $(Build.RequestedFor)"
      echo "Triggered By User Email: $(Build.RequestedForEmail)"
      echo "Triggered By User ID: $(Build.RequestedForId)"
      echo "Triggered By User Display Name: $(Build.RequestedForDisplayName)"
      echo "Triggered By User Username: $(Build.RequestedForUsername)"
      echo "Triggered By User Teams ID: $(Build.RequestedForTeamsId)"
      echo "Pipeline Execution Directory: $(System.DefaultWorkingDirectory)"
      echo "Build Source Branch: $(Build.SourceBranch)"
      echo "Build Repository Name: $(Build.Repository.Name)"
      echo "Build Repository ID: $(Build.Repository.ID)"
      echo "Build Repository Type: $(Build.Repository.Provider)"
      echo "Build Repository URL: $(Build.Repository.Uri)"
      echo "Build Repository Default Branch: $(Build.Repository.DefaultBranch)"
      echo "Build Definition Name: $(Build.DefinitionName)"
      echo "Build Definition ID: $(Build.DefinitionID)"
      echo "Build Build Number: $(Build.BuildNumber)"
      echo "Build Build ID: $(Build.BuildID)"
      echo "Build Build URI: $(Build.BuildUri)"
      echo "Build Source Version: $(Build.SourceVersion)"
      echo "Build Source Version Message: $(Build.SourceVersionMessage)"
      echo "Build Source Branch Name: $(Build.SourceBranchName)"
      echo "Build Source Version Author: $(Build.SourceVersionAuthor)"
      echo "Build Reason: $(Build.Reason)"
      echo "Build Source Provider: $(Build.SourceProvider)"
      echo "Build Repository Clean: $(Build.Repository.Clean)"
      echo "------------------"
  
```

## Environment variables

Environment variables are specific to the operating system you're using. They're injected into a pipeline in platform-specific ways. The format corresponds to how environment variables get formatted for your specific scripting platform.

Environment variables also provide insights into the capabilities of the agent executing the pipeline. For instance, variables like Agent.OS and Agent.Version reveal the operating system and agent version, respectively, aiding in writing platform-agnostic pipeline scripts or conditionally executing tasks based on agent capabilities.

On UNIX systems (macOS and Linux), environment variables have the format $NAME. On Windows, the format is %NAME% for batch and $env:NAME in PowerShell.

> [!Note]
> System and user-defined variables also get injected as environment variables for your platform.
> When variables convert into environment variables, variable names become uppercase, and periods turn into underscores.
>For example, the variable name any.variable becomes the variable name $ANY_VARIABLE.

```
echo "Agent Information:"
  - script: |
      echo "Agent Information:"
      echo "------------------"
      echo "Agent.Name: $(Agent.Name)"
      echo "Agent.OS: $(Agent.OS)"
      echo "Agent.Version: $(Agent.Version)"
      echo "Agent.WorkFolder: $(Agent.WorkFolder)"
      echo "Agent.ToolsDirectory: $(Agent.ToolsDirectory)"
      echo "Agent.TempDirectory: $(Agent.TempDirectory)"
      echo "Agent.HomeDirectory: $(Agent.HomeDirectory)"
      echo "Agent.ContainerId: $(Agent.ContainerId)"
      echo "------------------"
```

Or

```
  - script: |
      echo "Environment Variables:"
      echo "------------------"
      printenv
```
### Access variables through the environment
Notice that variables are also made available to scripts through environment variables. The syntax for using these environment variables depends on the scripting language.


The name is upper-cased, and the . is replaced with the _. This is automatically inserted into the process environment. Here are some examples:
> [!note]
> Batch script: %VARIABLE_NAME%

> PowerShell script: $env:VARIABLE_NAME

> Bash script: $VARIABLE_NAME


## List variables is CLI
You can list all of the variables in your pipeline with the az pipelines variable list command.
```
az pipelines variable list [--org]
                           [--pipeline-id]
                           [--pipeline-name]
                           [--project]
```

## List all variables in pipeline
### To add variable in GUI
- To set variable in the web interface, follow these steps:
- Go to the Pipelines page, select the appropriate pipeline, and then select Edit.
- Locate the Variables for this pipeline.
- Add or update the variable. for example myguivar
- Save the pipeline.

### To add a secret in GUI
To set secrets in the web interface, follow these steps:

- Go to the Pipelines page, select the appropriate pipeline, and then select Edit.
- Locate the Variables for this pipeline.
- Add or update the variable. for example myguisecret
- Select the option to Keep this value secret to store the variable in an encrypted manner.
- Save the pipeline.

> [!Important]
> Secret value appears as *** when you display it on output window
> For example $(myguisecret) will show *** in Output window 

### Variable Groups

#### Create a Group and variable
To use a variable group, open your pipeline. Select Variables > Variable groups, and then choose Link variable group. In a build pipeline, you see a list of available groups. In a release pipeline, for example, you also see a drop-down list of stages in the pipeline. Link the variable group to one or more of these stages in the pipeline.

Group name: MyNewVariableGroup
Group variable name: myvariableinsideagroup

#### Authorize a variable group
To work with a variable group, you must authorize the group. If you only name the variable group in YAML, then anyone who can push code to your repository could extract the contents of secrets in the variable group. To authorize the group, use one of the following techniques:

To authorize any pipeline to use the variable group, go to Azure Pipelines. This might be a good option if you don't have any secrets in the group. Select Library > Variable groups, and then select the variable group in question and enable the setting Allow access to all pipelines.

To authorize a variable group for a specific pipeline, open the pipeline, select Edit, and then queue a build manually. You see a resource authorization error and an "Authorize resources" action on the error. Choose this action to explicitly add the pipeline as an authorized user of the variable group.

```
# Starter pipeline
# Start with a minimal pipeline that you can customize to build and deploy your code.
# Add steps that build, run tests, deploy, and more:
# https://aka.ms/yaml

trigger:
- none

parameters:
- name: image
  displayName: Pool Image
  type: string
  default: ubuntu-latest
  values:
  - windows-latest
  - ubuntu-latest
  - macOS-latest

variables:
  myVar: "My Data"


stages:
- stage: VariableTesting
  displayName: Just a test to check how variable are set and access
  jobs:
  - job: TestJob
    displayName: Test-Job Sample Name
    pool: Default
    variables:
     group: MyNewVariableGroup
    steps:
    - script: echo My parameter value is ${{ parameters.image }}
      displayName: 'My Parameters'
      
    - script: echo My variable value is $(myVar)
      displayName: 'My Variable'
      
    - script: echo My variable set through GUI value is $(myguivar)
      displayName: 'My GUI Variable'

    - script: echo My secret set through GUI value is $(myguisecret)
      displayName: 'My GUI Secret'

    - script: echo My variable from a variable group set through GUI value is $(myvariableinsideagroup)
      displayName: 'My GUI group variable '
      


    - script: |
        echo System Variable BuildNumber is $(Build.BuildNumber) and $(Build.BuildId)
        echo "System Pipeline Information:"
        echo "---------------------"
        echo "Azure DevOps Organization: $(System.CollectionUri)"
        echo "Azure DevOps Project: $(System.TeamProject)"
        echo "Pipeline Triggered By: $(Build.RequestedFor)"
        echo "Triggered By User Email: $(Build.RequestedForEmail)"
        echo "Triggered By User ID: $(Build.RequestedForId)"
        echo "Triggered By User Display Name: $(Build.RequestedForDisplayName)"
        echo "Triggered By User Username: $(Build.RequestedForUsername)"
        echo "Triggered By User Teams ID: $(Build.RequestedForTeamsId)"
        echo "Pipeline Execution Directory: $(System.DefaultWorkingDirectory)"
        echo "Build Source Branch: $(Build.SourceBranch)"
        echo "Build Repository Name: $(Build.Repository.Name)"
        echo "Build Repository ID: $(Build.Repository.ID)"
        echo "Build Repository Type: $(Build.Repository.Provider)"
        echo "Build Repository URL: $(Build.Repository.Uri)"
        echo "Build Repository Default Branch: $(Build.Repository.DefaultBranch)"
        echo "Build Definition Name: $(Build.DefinitionName)"
        echo "Build Definition ID: $(Build.DefinitionID)"
        echo "Build Build Number: $(Build.BuildNumber)"
        echo "Build Build ID: $(Build.BuildID)"
        echo "Build Build URI: $(Build.BuildUri)"
        echo "Build Source Version: $(Build.SourceVersion)"
        echo "Build Source Version Message: $(Build.SourceVersionMessage)"
        echo "Build Source Branch Name: $(Build.SourceBranchName)"
        echo "Build Source Version Author: $(Build.SourceVersionAuthor)"
        echo "Build Reason: $(Build.Reason)"
        echo "Build Source Provider: $(Build.SourceProvider)"
        echo "Build Repository Clean: $(Build.Repository.Clean)"
        echo "------------------"

      displayName: 'My System variables'

    - script: |
       echo ENv variable Agent Name is $(Agent.Name)
       echo "Agent Information:"
       echo "------------------"
       echo "Agent.Name: $(Agent.Name)"
       echo "Agent.OS: $(Agent.OS)"
       echo "Agent.Version: $(Agent.Version)"
       echo "Agent.WorkFolder: $(Agent.WorkFolder)"
       echo "Agent.ToolsDirectory: $(Agent.ToolsDirectory)"
       echo "Agent.TempDirectory: $(Agent.TempDirectory)"
       echo "Agent.HomeDirectory: $(Agent.HomeDirectory)"
       echo "Agent.ContainerId: $(Agent.ContainerId)"
       echo "------------------"
       echo "Other variables:"
       echo "env:HOME: $(env:HOME)"
       echo "------------------"

       echo "Environment Variables Complete List:"
       echo "------------------"
       # printenv
       set
      displayName: 'My Env variables'


    - script: |
        # Display the directory structure of $(Agent.Name) / $(Agent.BuildDirectory) recursively
        tree $(Agent.BuildDirectory)
        echo "----------------------"
        # ls -la $(Build.SourcesDirectory)
        cd $(Build.SourcesDirectory)
        dir
      displayName: 'Display the directory structure'
```

# YAML pipeline editor & management
> [!Note]
> Azure Pipelines provides a YAML pipeline editor that you can use to author and edit your pipelines. The YAML editor is based on the Monaco Editor. The editor provides tools like Intellisense support and a task assistant to provide guidance while you edit a pipeline.


## Edit a YAML pipeline
To access the YAML pipeline editor, do the following steps.

1. Sign in to your organization (https://dev.azure.com/{yourorganization}).
2. Select your project, choose Pipelines, and then select the pipeline you want to edit. 

## Use keyboard shortcuts
The YAML pipeline editor provides several keyboard shortcuts, which we show in the following examples.

- Choose Ctrl+Space for Intellisense support while you're editing the YAML pipeline.
- Choose F1 (Fn+F1 on Mac) to display the command palette and view the available keyboard shortcuts.

## Use task assistant
The task assistant provides a method for adding tasks to your YAML pipeline.

To display the task assistant, edit your YAML pipeline and choose Show assistant.

## Manage pipeline variables

You can manage pipeline variables both from within your 
1. YAML pipeline 
2. and from the pipeline settings UI.

### To manage pipeline variables, do the following steps.

1. Edit your YAML pipeline and choose Variables to manage pipeline variables.
2. Manage pipeline variables button.
3. Choose from the following functions:
- New variable: to add your first variable.
- Add  : to add subsequent variables.
- Variable name to edit a variable.
- Delete  : to delete a variable.

### Manage pipeline variables in the YAML editor.

To manage pipelines variables in the pipeline settings UI, do the following steps.

1. Edit the pipeline and choose More actions > Triggers.
2. Pipeline settings UI menu.
3. Choose Variables.

## Configure the default agent pool
If a YAML pipeline doesn't specify an agent pool, the agent pool configured in the Default agent pool for YAML setting is used. This pool is also used for post-run cleanup tasks.

To view and configure the Default agent pool for YAML setting:

1. Edit the pipeline and choose More actions > Triggers.

2. Screenshot of the pipeline settings UI menu.

3. Choose YAML, and select the desired agent pool using the Default agent pool for YAML dropdown list.

4. Screenshot of the default agent pool for YAML pipelines.

> [!note]
> Default agent pool for YAML is configured on a per-pipeline basis.
