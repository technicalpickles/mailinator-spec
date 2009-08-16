require 'spec/rake/spectask'

task :default => :spec

desc 'Start an IRB session with the library loaded'
task :console do
  sh "irb -I ./lib -r 'mailinator'"
end

desc 'Run the specs with autotest'
task :autotest do
  ENV['RSPEC'] = 'true'
  ENV['AUTOTEST'] = 'true'
  sh 'autotest'
end

desc 'Run the specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts = [ '--color', '--format progress', ]
  t.spec_files = FileList['spec/**/*_spec.rb']
end
