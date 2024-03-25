# Passing Values to container
Almost all apps need values to start the application. These values can either be hardcoded inside the app or can be passed through as variables usign environment variables.
These environmental variables can be used like database connections string and other config variables like you mostly define in web.config or app setting files. 

# Define an environment variable for a container
When you create a Pod, you can set environment variables for the containers that run in the Pod. To set environment variables, include the env or envFrom field in the configuration file.
The env and envFrom fields have different effects.
## env
It allows you to set environment variables for a container, specifying a value directly for each variable that you name.
## envFrom
It allows you to set environment variables for a container by referencing either a ConfigMap or a Secret. When you use envFrom, all the key-value pairs in the referenced ConfigMap or Secret are set as environment variables for the container. You can also specify a common prefix string.

# env
> [!TIP]
> It allows you to set environment variables for a container, specifying a value directly for each variable that you name.
