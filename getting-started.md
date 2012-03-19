# getting started

## setting up the development enviroment on a windows box

### setting up github
[git for windows] (http://help.github.com/win-set-up-git/)

Note: once you have done this, the setup doesn't add git to the system PATH, you should do this manually by adding C:\Program Files (x86)\Git\bin to your user or system path

Note Note: you need to logout/login for any changes to the system path to take effect.


#### PoshGit - pwershell plugins for git
[better git with powershell] (http://haacked.com/archive/2011/12/13/better-git-with-powershell.aspx)
[get git for windows] (http://haacked.com/archive/2011/12/19/get-git-for-windows.aspx)


### installing node.js & coffee script
[node.js] (http://nodejs.org/)
[download node.js installer] (http://nodejs.org/dist/v0.6.13/node-v0.6.13.msi)

[how to install coffee script] (http://autotelicum.github.com/Smooth-CoffeeScript/literate/install-notes.pdf)


### ide
Download and install [Sublime Text 2] (http://www.sublimetext.com/2)


### sublimetext/textmate coffee-script plugins 
[coffee script tmbundle] (https://github.com/jashkenas/coffee-script-tmbundle)

goto %appdata%\sublime text 2\preferences and create a coffee-script folder
clone the repository above into this folder 
	
	git clone git@github.com@jashkenas/coffee-script-tmbundle .

navigate to commands folder and modify the CoffeeScript.sublime-build
	
	{
		"path": "$HOME/bin:/usr/local/bin:$PATH",
		"cmd": ["coffee","-c","$file"],
		"file_regex": "^(...*?):([0-9]*):?([0-9]*)",
		"selector": "source.coffee"
	}
to
	
	{
		"cmd": ["coffee","-c","$file"],
		"file_regex": "^(...*?):([0-9]*):?([0-9]*)",
		"selector": "source.coffee"
	}

and your all done :)


## Getting started git commands

Get a copy of the project from github

	git checkout git@github.com:theouteredge/Fantasy-F1 .

Commit any changes locally

	git add .
	git commit -m "your message"

Push your changes back to github

	git push origin

Get changes from github

	git pull origin

Create a branch

	git branch [branch name]

Create a local branch and switch to it

	git co -b [branch name]

Switch branches

	git co [branch name]

Merge two branches

	git merge [branch1]/[branch2]