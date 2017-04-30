
Before running an app install redis

```
apt-get install redis-server
service redis-server restart
```

And run a default queue for background jobs:

`bundle exec sidekiq -q default`


Rename database.yml.example to database.yml:
```
$ mv database.yml.example database.yml
```

Set `username` and `password` values right for your db settings in database.yml file.

Setup db:
```
rails db:create && rake db:migrate && rake db:seed
```

Run server:
```
rails s
```

### Build With
* Ruby 2.4.0
* Rails 4.2.8
