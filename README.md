![Imgur](https://i.imgur.com/c02KSz6.png)

## User stories  

```
As a host  
So I can attract guests to my property  
I want to list my space on MakersBnB  
```
```
As a host  
So I can attract guests to my array of properties  
I want to list multiple spaces on MakersBnB  
```
```
As a host  
So I can describe my place  
I want to be able to add a name, short description, and a price per night  
```
```
As a host  
So I can showcase the availability of my properties  
I want to be able offer a range of dates  
```
```
As a host  
So my spaces can be hired  
I want to be able to receive requests from guests  
```
```
As a guest  
So I can hire a space  
I would like to be able to send a request to the host  
```
```
As a guest  
So that I do not book a space that has already been hired  
I would like to be able to see only available dates  
```
```
As a host  
So that I can prevent overbookings  
I would like only available dates to appear to potential guests  
```
```
As a host  
So that I can be protected from unreliable guests  
I would like spaces to be available to hire until the booking request has been accepted  
```

## Domain Model

![Domain Model](https://imgur.com/Z9YtFFu.png)


## How to use

### Getting started:

Clone this repository and then run:

``` 
bundle
```

### To set up a data base

To set up the MakersBnb database follow the below steps:
```
rake db:create
```
```
rake db:migrate
```
### To run MakersBnB:

```
rackup
```

To view MakersBnB navigate to http://localhost:9292


### To  run tests:

```
rspec
```

### To run linting:

```
rubocop
```
