[![Build Status](https://travis-ci.org/DejanAcim/knowledge_base.svg?branch=master)](https://travis-ci.org/DejanAcim/knowledge_base)

# Knowledge Base

This is my own project for recruitment purposes.

Knowledge Base app allows users to prepare Training Plans. Every Training Plan is basically a course which consists of several trainings. This may be a useful tool for a team leader or a mentor to prepare a kind of roadmap for their trainees to work on a specific set of tools or technologies.

Every Training Plan may have several skills attached enabling other users to have a quick view on what is actually trained with this course. It also provides a listing function by skill or specific training which may come in handy for other users to find, review and reuse an already created Training Plan. All logged in users are able to review all Training Plans, vote (only once) if they like them or not and leave comments. Features other users will surely find useful when making a decision on reusing or rebuilding a given Training Plan.

## Technologies

* Rails 5.1.4
* Ruby 2.4.0

## Access and Live Demo

* Live demo: https://justmyknowledgebase.herokuapp.com/

You need a user to create new Training Plans, trainings, comments and skills. No user is necessary to view listings. Everyone can sign up on the home page.

A signed in user is also able to edit his Training Plans.

For a full set of privileges please log in as admin user:
```
email: admin@example.com
password: password
```

## Features

* Model validations
* One-to-many and many-to-many associations
* Own authentication system from scratch
* Git branching
* Bootstrap 3
* Admin functionality
* jQuery/AJAX comments
* Like/dislike voting
* Gravatars for users
* Pagination
* Model and feature tests with minitest, RSpec and Capybara
* Factories with FactoryBot
