# Pigi

Pigi is a command line tool that automatically adds your Pivotal Tracker story ID into your commit message. The purpose of this tool is to speed up development process of developers using [Github’s service hook for Pivotal Tracker](http://www.pivotaltracker.com/community/tracker-blog/guide-githubs-service-hook-tracker).

## Installation

To install this tool execute a command:

    $ gem install pigi

## Usage

When you begin to work on a particular story in Pivotal Tracker firstly set ID (for example ID = 12345678) of this story by executing a command:

	$ pigi s 12345678 
	
Now every time you want to commit changes in your git repository you do it by typing:

	$ pigi m "add awesome feature"
	
The result of this command is identical to this command:

	$ git commit -m "add awesome feature [#12345678]"
	
If you want to work on another story just simply set pigi to your current story ID that you are working on:

	$ pigi s 87654321