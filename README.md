<h1 align="center"> MakersBnB </h1>

<p align="center">
  <a href="#user-content-installation">Installation</a> •
  <a href="#user-content-approach">Approach</a> •
  <a href="#user-content-specifications">Specifications</a> •
  <a href="#user-content-technologies">Technologies</a> 
</p>

MakersBnB is a web app that allows users to view available properties for rent.

This was a team project, with input from the following people:
- [Jay Issurree](https://github.com/JayIssuree)
- [Jess Lonsdale](https://github.com/jlonsdale)
- [Pamela Mezue](https://github.com/mezela)
- [Alec Walker](https://github.com/AlecDWalker)

## Installation

1. Clone this repository. 

2. Ensure Ruby is installed (using either RVM or RubyInstaller) and ensure postgresql is installed
```
$ brew install postgresql
``` 

3. Create the databases in the terminal
```
$ CREATE DATABASE MakersBnB_development
$ CREATE DATABASE MakersBnB_test
```

4. Then move into the folder and install dependencies: 
```
$ cd path/to/makersbnb
$ bundle install
```

5. From the MakersBnB directory, run terminal command:
```
$ rackup
```

6. View the website by opening a browser and navigate to:
```
http://localhost:9292
```

### Run the tests
```
$ rspec
```

## Approach

We started by deciding what our database tables would contain and then discussing what domain relationships there would be between them:

#### CRC Models

TABLE: Users
| id | forename | surname | email | username | password (encrypted) |
has n: listings, bookingrequests, Approvedrequests

TABLE: Listings
| id | name | description | cost | user_id | date_from | date_to |
belongs to: user
has n: bookingrequests, Approvedrequests

TABLE: Bookingrequests
| id | requested_date | listing_id | user_id | message |
belongs to: listing, user

TABLE: Bookings / Approvedrequests
| id | listing_id | user_id | date |
belongs to: listing, user

#### Domain Relationships

ONE MakersBnB has MANY Users
| MakersBnB |-----≡| Users |

ONE User has MANY Listings
| User |-----≡| Listings |

ONE Listing has MANY BookingRequests
| Listing |-----≡| BookingRequests |

ONE Listing has MANY ApprovedBookings
| Listing |-----≡| ApprovedBookings |

### Next steps

We were able to implement our MVP and some additional features however,
we didn't have time to implement the following user stories so that would be what we focus on next:
```
-Users should receive a text message to a provided number whenever one of the following happens:
-A user requests to book their space
-Their request to book a space is confirmed
-Their request to book a space is denied

-A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space

-Basic payment implementation though Stripe.
```
We would also have liked to implement an ORM (e.g. DataMapper or ActiveRecord) as part of refactoring the code.

## Specifications

Below are the specifications we were provided. We used these to develop user stories and decide what we needed to include in the MVP.

### Features

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that -owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

Other features:
- Users should receive an email whenever one of the following happens:
    - They sign up
    - They create a space
    - They update a space
    - A user requests to book their space
    - They confirm a request
    - They request to book a space
    - Their request to book a space is confirmed
    - Their request to book a space is denied

### User Stories

User Stories for the MVP
```
As a user
so that I can use the service
I would like to sign up with username, password and email
```

```
As a user
So that I can advertise my properties
I would like to be able to list one or more spaces tied to my account
```

```
As a user
So that I can advertise my spaces' features
I would like to add a price, description and title to a space
```

```
As a user
So that I can plan my schedule
I would like to add a range of available dates for a space
```


Additional User Stories
```
As a user(guest)
So that I can plan my own journeys
I can request to stay in a space for one night
```

```
As a user(owner)
So that I can let out spaces
I would like to be able to approve stay requests
```

```
As a user
To avoid scheduling conflicts
I would like non-available dates not to be viewable
```

```
As a user(owner)
So that a date is not locked out unnecessarily
I would like a date to be available until a booking is confirmed
```


## Technologies

- Ruby
- Sinatra
- Testing: RSpec, Capybara
- Database: Postgresql

