Kaiki Features
===================

This is the project which will hold all of the Cucumber feature files for UofA


### Rakefile Requirements

* `rake (10.1.0, 0.9.2.2)` should be installed to run rake tasks.
* `--tags` are used to call some rake tasks, `@kctest` is for tests that dont need to be run in order.
* The tags need to be added to line one of each feature file.
* An ECE.rb file with an array of tags is stored in the `katt-kaiki/features/support/`, this is used to run features files in order.
* Then the rake task: `rake run` can be used to run everything in order.
