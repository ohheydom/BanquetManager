# Banquet Manager

This Ruby on Rails project keeps track of all the events I've booked. It can sort the information by name, date booked, date of the event, and other options. You can view by events that have already occurred, future events, or all events. It calculates commission. And most importantly, it also creates a 6 week To-Do list. It has multiple users as well, so each manager can store his/her clients' information.

## Background

Originally I was using OpenOffice Calc to keep track of all the events I booked. Every few weeks I would go in, sort by date, write down when all the payments were due, then sort by menu date and write down all the parties I needed to do the menu for. Extracting all the data by hand became tiresome. So I automated it.

## Todo List

* Less database queries

## Installation

I've used postgresql, so as long as that's already installed, this should be simple. Or you can migrate it over to mysql.

```
bundle install
```

Adjust the username and password in the database.yml file to match your postgres roles.

```
rake db:setup
rake db:migrate
```

And you're good to go.
