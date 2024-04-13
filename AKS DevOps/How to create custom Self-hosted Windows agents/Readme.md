## Create Self-hosted Windows agents

Default agent pools
The following agent pools are provided by default:

Default pool: Use it to register self-hosted agents that you've set up.
Azure Pipelines hosted pool with various Windows, Linux, and macOS images. For a complete list of the available images and their installed software, see Microsoft-hosted agents.

## Create a Self hosted agent pool
```
Select organization 
Settings / Agent pools / Default
Click New Agent
On the Get the agent dialog box, choose Windows.

On the left pane, select the processor architecture of the installed Windows OS version on your machine. The x64 agent version is intended for 64-bit Windows, whereas the x86 version is intended for 32-bit Windows. If you aren't sure which version of Windows is installed, follow these instructions to find out.

On the right pane, click the Download button.

Follow the instructions on the page to download the agent.

Unpack the agent into the directory of your choice. Make sure that the path to the directory contains no spaces because tools and scripts don't always properly escape spaces. A recommended folder is C:\agents. Extracting in the download folder or other user folders may cause permission issues.


Start an elevated (PowerShell) window and set the location to where you unpacked the agent.
for example create an 'agent' folder on c\:

Start an elevated (PowerShell) window and set the location to where you unpacked the agent.
cd C:\agents 

Run config.cmd. This will ask you a series of questions to configure the agent.
.\config.cmd

Server URL
When setup asks for your server URL, for Azure DevOps Services, answer https://dev.azure.com/{your-organization}.



Agent setup authentication type
When you register an agent, choose Personal access token

Create a personal access token for agent registration

Sign in with the user account you plan to use in your Azure DevOps organization (https://dev.azure.com/{your_organization}).

From your home page, open your user settings, and then select Personal access tokens.
Create a personal access token.

Screenshot of creating a personal access token.

For the scope select Agent Pools (read, manage) and make sure all the other boxes are cleared. If it's a deployment group agent, for the scope select 
Deployment group (read, manage) and make sure all the other boxes are cleared.

Select Show all scopes at the bottom of the Create a new personal access token window window to see the complete list of scopes.

Copy the token. You'll use this token when you configure the agent.

```

## Run the agent 
```
Run the agent
Run interactively
If you configured the agent to run interactively, run the following the command to start the agent.

ps

Copy
.\run.cmd
To restart the agent, press Ctrl+C to stop the agent, and then run run.cmd to restart it.

Run once
You can also choose to have the agent accept only one job and then exit. To run in this configuration, use the following command.

ps

Copy
.\run.cmd --once
Agents in this mode will accept only one job and then spin down gracefully (useful for running in Docker on a service like Azure Container Instances).

Run as a service
If you configured the agent to run as a service, it starts automatically. You can view and control the agent running status from the services snap-in. Run services.msc and look for one of:

"Azure Pipelines Agent (name of your agent)"
"VSTS Agent (name of your agent)"
"vstsagent.(organization name).(name of your agent)"
To restart the agent, right-click the entry and choose Restart.
```

### Replace an agent
```
To replace an agent, follow the Download and configure the agent steps again.

When you configure an agent using the same name as an agent that already exists, you're asked if you want to replace the existing agent. If you answer Y, then make sure you remove the agent (see below) that you're replacing. Otherwise, after a few minutes of conflicts, one of the agents will shut down.
```

### Remove and reconfigure an agent
```
To remove the agent:

ps

Copy
.\config remove
```

## Attache Agent to Pipeline
```
Designate a pool in your pipeline

To choose a Microsoft-hosted agent from the Azure Pipelines pool in your Azure DevOps Services YAML pipeline, specify the name of the image, using the YAML VM Image Label from this table.
pool:
  vmImage: ubuntu-latest # This is the default if you don't specify a pool or vmImage.

To use a private pool with no demands:
pool: MyPool


Pool and agent names
Open pipe line and replace the pool entry with 
Pipelines / pipeline name/ click Edit
find and replace pool value to 
pool: Default

Run and accept permessions. 
Note: You will need to do this for both your build and release pipelines.

--pool <pool> - pool name for the agent to join
--agent <agent> - agent name
--replace - replace the agent in a pool. If another agent is listening by the same name, it will start failing with a conflict

```

Self hosted agent Maintenance job
```
You can configure agent pools to periodically clean stale working directories and repositories. This should reduce the potential for the agents to run out of disk space. Maintenance jobs are configured at the organization level in agent pool settings.

To configure maintenance job settings:

Sign in to your organization (https://dev.azure.com/{yourorganization}).

Choose Azure DevOps, Organization settings.

Choose Organization settings.

Choose Agent pools.

Choose Agent pools tab.

Choose the desired pool and choose Settings to configure maintenance job settings for that agent pool.
Configure your desired settings and choose Save.

Select Maintenance History to see the maintenance job history for the current agent pool. You can download and review logs to see the cleaning steps and actions taken.

Maintenance job history

The maintenance is done per agent pool, not per machine; so if you have multiple agent pools on a single machine, you may still run into disk space issues.

```