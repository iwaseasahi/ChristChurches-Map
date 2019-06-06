***REMOVED*** This file was generated by the `rails generate rspec:install` command. Conventionally, all
***REMOVED*** specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
***REMOVED*** The generated `.rspec` file contains `--require spec_helper` which will cause this
***REMOVED*** file to always be loaded, without a need to explicitly require it in any files.
***REMOVED***
***REMOVED*** Given that it is always loaded, you are encouraged to keep this file as
***REMOVED*** light-weight as possible. Requiring heavyweight dependencies from this file
***REMOVED*** will add to the boot time of your test suite on EVERY test run, even for an
***REMOVED*** individual file that may not need all of that loaded. Instead, consider making
***REMOVED*** a separate helper file that requires the additional dependencies and performs
***REMOVED*** the additional setup, and require it from the spec files that actually need it.
***REMOVED***
***REMOVED*** The `.rspec` file also contains a few flags that are not defaults but that
***REMOVED*** users commonly want.
***REMOVED***
***REMOVED*** See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require 'factory_girl_rails'
require 'simplecov'

SimpleCov.start 'rails'

RSpec.configure do |config|
  ***REMOVED*** rspec-expectations config goes here. You can use an alternate
  ***REMOVED*** assertion/expectation library such as wrong or the stdlib/minitest
  ***REMOVED*** assertions if you prefer.
  config.expect_with :rspec do |expectations|
    ***REMOVED*** This option will default to `true` in RSpec 4. It makes the `description`
    ***REMOVED*** and `failure_message` of custom matchers include text for helper methods
    ***REMOVED*** defined using `chain`, e.g.:
    ***REMOVED*** be_bigger_than(2).and_smaller_than(4).description
    ***REMOVED***   ***REMOVED*** => "be bigger than 2 and smaller than 4"
    ***REMOVED*** ...rather than:
    ***REMOVED***   ***REMOVED*** => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  ***REMOVED*** rspec-mocks config goes here. You can use an alternate test double
  ***REMOVED*** library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    ***REMOVED*** Prevents you from mocking or stubbing a method that does not exist on
    ***REMOVED*** a real object. This is generally recommended, and will default to
    ***REMOVED*** `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  ***REMOVED*** FactoryGirl を省略する
  config.include FactoryGirl::Syntax::Methods

***REMOVED*** The settings below are suggested to provide a good initial experience
***REMOVED*** with RSpec, but feel free to customize to your heart's content.
=begin
  ***REMOVED*** These two settings work together to allow you to limit a spec run
  ***REMOVED*** to individual examples or groups you care about by tagging them with
  ***REMOVED*** `:focus` metadata. When nothing is tagged with `:focus`, all examples
  ***REMOVED*** get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  ***REMOVED*** Limits the available syntax to the non-monkey patched syntax that is recommended.
  ***REMOVED*** For more details, see:
  ***REMOVED***   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
  ***REMOVED***   - http://teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  ***REMOVED***   - http://myronmars.to/n/dev-blog/2014/05/notable-changes-in-rspec-3***REMOVED***new__config_option_to_disable_rspeccore_monkey_patching
  config.disable_monkey_patching!

  ***REMOVED*** Many RSpec users commonly either run the entire suite or an individual
  ***REMOVED*** file, and it's useful to allow more verbose output when running an
  ***REMOVED*** individual spec file.
  if config.files_to_run.one?
    ***REMOVED*** Use the documentation formatter for detailed output,
    ***REMOVED*** unless a formatter has already been configured
    ***REMOVED*** (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  ***REMOVED*** Print the 10 slowest examples and example groups at the
  ***REMOVED*** end of the spec run, to help surface which specs are running
  ***REMOVED*** particularly slow.
  config.profile_examples = 10

  ***REMOVED*** Run specs in random order to surface order dependencies. If you find an
  ***REMOVED*** order dependency and want to debug it, you can fix the order by providing
  ***REMOVED*** the seed, which is printed after each run.
  ***REMOVED***     --seed 1234
  config.order = :random

  ***REMOVED*** Seed global randomization in this process using the `--seed` CLI option.
  ***REMOVED*** Setting this allows you to use `--seed` to deterministically reproduce
  ***REMOVED*** test failures related to randomization by passing the same `--seed` value
  ***REMOVED*** as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
