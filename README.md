# Log Parser

A program that handles a log file from a webserver.
It parses the data in the file and returns a list of the most visited pages.


## Instructions

Clone this repo and run ```bundle install```.
Open IRB, type ```require 'app.rb'``` and then ```app.parse(<file>)``` replacing ```<file>``` with the path to the file you wish to be parsed.


---

## Who is the user and what do they do

The user handles large amounts of data stored in a file.
The data registers all accesses to the server, listing page visits according to an IP.
The user wants group the visits by page, count them, and return an ordered list.

## What is the acceptance criteria

app.parse(log_file) =
  "/home 90 visits /index 80 visits..." &
  "/about/2 8 unique views /index 5 unique views..."

## What are the input and output types?

The input is a .log file and the output prints an ordered list of most visited websites.

## What are edge and naive cases?

Edge cases:
An empty file should throw an Error;

## User stories

As a data analyst
so that I can organise my data
I want to be able to extract individual lines from a log file
:check:

As a data analyst
so that I can organise my data
I want each line to show only the page visited
:check:

As a data analyst
so that I can organise my data
I want to know the total number of visits to a page
:check:

As a data analyst
so that I can organise my data
I want to be able to separate normal views from unique views
:check:

As a data analyst
so that I can organise my data
I want my list of page views sorted in a descending order
:check:

As a data analyst
so that I can organise my data
I want to print out this list
:check:
