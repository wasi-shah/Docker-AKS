# Git
Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

## Github Repo and Check-In Code

### Create a GitHub Repo
In the upper-right corner of any page, select , then click New repository.

Screenshot of a GitHub dropdown menu showing options to create new items. The menu item "New repository" is outlined in dark orange.

Type a short, memorable name for your repository. For example, "hello-world".

Screenshot of the first step in creating a GitHub repository. The "Repository name" field contains the text "hello-world" and is outlined in dark orange.

Optionally, add a description of your repository. For example, "My first repository on GitHub."

Choose a repository visibility. For more information, see "About repositories."

Select Initialize this repository with a README.

Click Create repository.

### Create a local git 
```
# Create a folder for all Repos we are going to create 
mkdir MyCode
cd MyCode
```

### Copy all files
Copy your project source code to MyCode
```
Here you can create .cs files etc
```

###  Create Readme.md
```
echo "# My First Commit" >> README.md
```


### Add new files to local git 
```
git add .
```

###  Do local Commit
```
git commit -am "V1 Base Commit"
```

###  Link Github Remote Repository
```
git remote add origin URL
```


###  Push to Remote Repository
```
git push --set-upstream origin master
or
git push
```


###  Pull changes github repo to local repo
```
git pull

```

### Pull github repo, Make changes to file, commit to local and push changes to git repo
```
git pull

# Make changes to index.html
index.html file - change version v2

# Add new files
echo "contents of my new file" >> I-am-a-new-file.html

# Add new file to be a part of commit
git add .

# Push changes
git commit -am "V2 Commit for index.html"
git push
```

