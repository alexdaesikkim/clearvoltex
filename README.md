# ClearVoltex

## https://www.clearvoltex.net/

SDVX clear and score management web application, using Ruby on Rails.
It's currently deployed online as closed beta, and requires approval for usage.

## What is ClearVoltex

ClearVoltex is a web application that keeps track of user's stats for the arcade game, SDVX. Currently, it tracks clears and scores, as well as discussions for each song among the users.

ClearVoltex was inspired by http://sdvx-level.github.io which was used by many SDVX players back in 2014, but have become obsolete since release of SDVX 3.


## Current Version: 0.2.0

## Version history:

0.2.0 (Current Version)

* Comments are enabled for majority of the songs
	- If comments are disabled for a particular song, it is to stop people from flaming and toxic discussions, based on Facebook group discussions.
	- Report functionality needs to be implemented

* Authorization (for closed Beta) has been added, along with simple user stats
	- Currently, user stats don't give as much information and serves more like a placeholder

* Minor bug fixes
	- Mobile functionality has been fixed
	- Buttons have been fixed (pressing the button outsize of text area would not redirect the user)
	- Minor functionality mishaps (Score/Clear button)

0.1.0

* Actual data seeded for levels 15 through 20

* Removed Songs model (not necessary for now, or ever)

* Changed few other things
	- Associative model not created on user creation anymore
	- Tier added
	- Score column is added but no support for it yet

* Still need to work on
	- Authorization
	- User stats page


0.0.1

* Simpe method on Jackets working

* Dummy data for seeds to test front-end work

* User sessions working