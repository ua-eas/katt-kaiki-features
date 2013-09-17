Kaiki Features
===================

This is the project which will hold all of the Cucumber feature files for UofA


### Rakefile Requirements

* `rake (10.1.0, 0.9.2.2)` should be installed to run rake tasks
* `--tags` are used to call some rake tasks, `@kc` is for tests needing to be run in order (example = @kc1), `@kctest` is for tests that dont need to be run in order
* The tags need to be added to line one of each feature file, i e `@kc` for odered tests and `@kctest` for tests that do not need to be run in order
* An ECE.rb file with an array of @kc tags is stored in the `/home/vagrant/code/katt-kaiki/features/support/`, this is used to run features files in order
* Then the rake task: `rake run` can be used to run everything in order
