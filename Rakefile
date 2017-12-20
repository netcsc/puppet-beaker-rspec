require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-strings/tasks'

if RUBY_VERSION >= '1.9'
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end

PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.relative = true
PuppetLint.configuration.ignore_paths = ['spec/**/*.pp', 'pkg/**/*.pp', 'vendor/**/*.pp', 'path/**/*.pp']

PuppetSyntax.exclude_paths = ['spec/**/*.pp', 'pkg/**/*.pp', 'vendor/**/*']

desc 'Validate manifests, templates, and ruby files'
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb', 'lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ %r{spec/fixtures}
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end

desc 'Run metadata_lint, lint, validate, and spec tests.'
task :test do
  [:metadata_lint, :lint, :validate, :spec].each do |test|
    Rake::Task[test].invoke
  end
end

desc 'Generate documentation'
task :doc do
  Rake::Task['strings:generate'].invoke(
      '**/*{.pp\,.rb}',  # patterns
      'false', # debug
      'false', # backtrace
      'markdown',
      '--readme README.md',
  )
end