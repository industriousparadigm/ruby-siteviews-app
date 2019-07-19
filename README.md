# Smart Pension code challenge

Diogo Costa, 18 July 2019

## Description

This Ruby app takes a text file where each line describes a hit on a website's page. Each "hit" contains the URL of the page and the visitor's IP address. The app then returns two tables counting each page views, separated by unique and non-unique visits.

## Running the app

Run `bundle install` if you don't have the RSpec Ruby gem.

Run the application with this command
`bin/app webserver.log`

To run tests, type the following
`rspec -f d`
