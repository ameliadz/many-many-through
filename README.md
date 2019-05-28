## many-to-many with through table

The simplest rule of thumb is that you should set up a `has_many :through` relationship if you need to work with the relationship model as an independent entity. Examples include:

- User has many Friends through Friendships
- Post has many Tags through Tagging

#### Step 1 -- Create the models including the join table

```
rails g model User name:string
rails g model Movies name:string
rails g model Subscription type:string user:references movie:references
```

#### Step 2 -- A User streams Movies through a Subscription. Here is what the model associations look like:

```
class User < ApplicationRecord
  has_many :subscriptions
  has_many :movies, through: :subscriptions
end
```

```
class Movie < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
```

```
class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :movie
end
```

#### Step 3 -- Create the database tables

```
rails db:migrate
```

#### Step 4 -- Populate the Database

```
helen = User.create name: 'Helen'
thor = Movie.create title: 'Thor: Ragnarok'
Subscription.create type: 'monthly', user: helen, movie: thor
```

#### Step 5 -- Perform Finds and Queries

```
User.find_by(name: 'Helen').movies  # find all Helen's movies
User.joins(:subscriptions).where(subscriptions: {type: 'monthly'})
```
