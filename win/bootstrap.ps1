# Stuff i need

# RUN THIS in powershell

# https://github.com/lukesampson/scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

scoop update

# multiple connections for scoop
scoop install aria2

# extra repo has the other stuff we need
scoop bucket add extras

# git
scoop install git
# which
scoop install which

# openssh
#scoop install openssh
# [environment]::setenvironmentvariable(‘GIT_SSH’, (resolve-path (scoop which ssh)), ‘USER’)

# vscode
scoop install vscode
# tell vscode where git is:
# which git
# then File > Preferences > Settings, and under User Settings add: "git.path”: “c:\\the\\path\\to\\git”
# restart and then do: code .

# go
# https://github.com/golang/go/wiki/windows-scoop-install-go-cli
scoop install go 

# protoc
scoop install protobuf


# glfw
# Do we need it ?

# gcc
# needed for golang CGO etc.
scoop install gcc

# dart
# I dont think its needed actually... we see.
#scoop install dart-dev

# flutter
# NOT needed. hover does it.
scoop install flutter