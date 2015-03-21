# Educatea

This gem allows you to get exercises from Educatea's Algorithm Engine.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'educatea', github: 'Educatea/educatea' 
```

And then execute:

    $ bundle

Now add your Educatea's API ID and Token to your application.rb (If you don't have an ID and Token send us an email to [support@educatea.com.ar](mailto:support@educatea.com.ar), we'll give you one)  

```ruby
ENV['EDUCATEA_APPID'] = "XXXXXXXXXX"
ENV['EDUCATEA_TOKEN'] = "XXXXXXXXXX"
```    

## Usage

```ruby
# With ID:
Educatea.exercise(<EDUCATEA-EXERCISE-ID>)     

# Random:
Educatea.random

# Solve:
Educatea.solve(<YOUR-ANSWER>, <EDUCATEA-EX-TOKEN>, <EDUCATEA-EXERCISE-NAME>, <EXERCISE-LEVEL>)
# The token, name and level are provided when you ask for an exercise. See example bellow.
```

## Example

```ruby
# Create an object giving an exercises ID:    
e = Educatea.exercise(5)   

# Now you can get the exercise data you like:   
e.generate_text
# => "Work out: 2 + 2"
e.answers
# => [4,-4,0,2]    
    
# You can also pass the object a level as an option:    
e = Educatea.exercise(5, options{level: 5})   
    
# You can easily ask for a random exercises of random level
e = Educatea.random
e.generate_text
# => "Work out: 8 x 8 x 8"
e.answers
# => [8,3,24,512]    
   
# And finally, you can ask Educatea to solve de exercise 
e = Educatea.random
ans = Educatea.solve(100, e.ex_token, e.name, e.level)
ans.correct
# => False
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Details

Created by [Juan Gesino](https://github.com/juangesino) for [Educatea](http://educatea.com.ar)

## Contributing

1. Fork it ( https://github.com/educatea/educatea/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request