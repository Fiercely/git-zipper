# Git Zipper by Fiercely

- Author: André Ilhicas dos Santos
- Contact: andre.ilhicas@fiercely.pt
- License: MIT
- Version: 0.1

## What is Git Zipper

[![Docker Stars](https://img.shields.io/docker/stars/fiercely/git-zipper.svg)](https://hub.docker.com/r/fiercely/git-zipper/)[![Docker Stars](https://img.shields.io/docker/pulls/fiercely/git-zipper.svg)](https://hub.docker.com/r/fiercely/git-zipper/)

Sometimes you only need some folders, a single file, or only the files ending on .xml.

This docker image makes use of git sparse-checkout to retrieve only the files based on the regex expression given.

To retrieve in a zip file, any of the regular expression(files, extensions, folders etc..) of a given open git repository without the need to retrieve the whole repository or clone the repository in your local machine.

## Environment variables that can be passed to the run command (using -e VAR)

    PATHS="This is the folder, regex or file to retrieve"
    GIT_BRANCH="on what branch you want to zip" - defaults to master
    GIT_URL="The url of the git repository, current version only allows open repo" - defaults to this repo
    NAME="Name of the zip file to generate" - defaults to fiercely

## Simple Usage to retrieve all markdown files for this repository

    docker run --name git-zipper -e PATHS=*.md fiercely/git-zipper

Generates a file named fiercely.zip living inside the container.
Use the command output after it ran to retrieve the file

    docker cp git-zipper:fiercely.zip git-zipper.zip

when done remove the container

    docker rm git-zipper

## A more complex usage from Use case that drove the motivation behind this project

For instance imagine you only require a small part of large repository
example of keycloak repository and the example we wish to extract without cloning the whole repository
https://github.com/keycloak/keycloak/tree/master/examples/saml

In this case you would require all the pom.xml files given their use of parents, and the folder to the concrete example

    docker run --name git-zipper -e PATHS=examples/saml/*,pom.xml -e GIT_BRANCH=master -e GIT_URL https://github.com/keycloak/keycloak -e NAME=saml_examples fiercely/git-zipper

Generates a file named saml_examples.zip living inside the container.

Generates a file named fiercely.zip living inside the container.
Use the command output after it ran to retrieve the file

or run the below command

    docker cp git-zipper:fiercely.zip git-zipper.zip

when done remove the container

    docker rm git-zipper