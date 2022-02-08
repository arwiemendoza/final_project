# Handy Bunny

    Ruby Version ruby-2.7.4

## Installation

```
git clone https://github.com/arwiemendoza/final_project.git
```

```
cd final_project
```

```
For Windows:

    sudo service postgresql start
```

```
For Mac:

    brew services start postgresql
```

```
bundle install
```

```
rails db:migrate
```

```
rails db:seed
```

```
For Windows:

    Open database.yml
    Uncomment username and password
```

```
For Mac:

    Open database.yml
    Comment username and password
```

```
rails s
```

## Demo

    https://thehandybunny.herokuapp.com/

<br/>

## Sample Credentials

    Admin

        email: admin@gmail.com

        password: 123456

    Helper

        email: helper@gmail.com

        password: 123456


    Client

        email: user@gmail.com

        password: 123456

\*_please delete tasks that you create while testing_

## Features

-   User is able to create new account
-   User has an option to create an account as a helper
-   User is able to create, read, update, delete tasks by category
-   Helper is able to view and apply on a specific task
-   User can choose from the helpers that have applied on the task
-   Helper/client can rate the client/helper upon finishing the task

## Extra Features

-   New accounts will be required to upload a photo for verification
-   On creating tasks, user will be required to pinpoint the location for helpers to use to navigate task location

