SpreeProductLike
================
Compatible with 3-0-stable version of spree
This extensions adds a like/fav button for products.

How it works?
-------------

As a logged in user:

  - i can go to product page and like the product 
  - see if I liked the product already
  - go to my 'favourites' products tab 

As a logged in admin i can: 

  - see list of products ordered by likes count 

Installation
------------

Add spree_product_like to your Gemfile:

```ruby
gem 'spree_product_like', git: 'https://github.com/mitijain123/spree_product_like.git', branch: 'master'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_product_like:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```
