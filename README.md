# Challenge: Messaging App
## Instructions
### How to setup:
      $ git clone git@github.com:jalena-penaligon/messaging-app.git
      $ cd messaging-app
      $ bundle
      $ rake db:{create,migrate,seed}
      $ rails s

### Run tests:
      Run tests with rspec:
      $ rspec

### View it in production:
This app is available in production at: https://mysterious-fortress-32635.herokuapp.com/

#### Access Credentials
This app is seeded with 2 default users to access the application functionality.

**Login as User 1:**

- email: user1@email.com
- password: password

**Login as User 2:**

- email: user2@email.com
- password: password

#### Known Issues
- After sending a message, the content area does not clear
- After sending a message, the submit button cannot be clicked again until the user has refreshed the browser first
- This application is hard-coded to handle 2 users
