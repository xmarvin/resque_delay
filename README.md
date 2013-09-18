# ResqueDelay

TODO: Analog for .delay method in DelayedJob for Resque

## Installation

Add this line to your application's Gemfile:

    gem 'resque'
    gem 'resque_delay'

And then execute:

    $ bundle

## Usage
  Execute methods of your ActiveRecord models and any modules in background easy

* Sending mail in background

  ResqueDelay::Job.enqueue YourMailer, :welcome, current_user

* Perform actions in background

  ResqueDelay::Job.enqueue current_user, :add_friend, some_user

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
