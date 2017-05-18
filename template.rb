# Add the current directory to the path Thor uses to look up files
source_paths.unshift(File.dirname(__FILE__))

copy_file 'Gemfile', force: true
copy_file 'README.md', force: true
copy_file 'gitignore', '.gitignore', force: true
copy_file 'rubocop.yml', '.rubocop.yml', force: true

apply 'app/template.rb'
apply 'config/template.rb'
apply 'lib/template.rb'

after_bundle do
  # Workaround to prevent spring from hanging
  run 'spring stop'

  generate 'rspec:install'
  remove_file 'test'
  apply 'spec/template.rb'

  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }

  rails_command("db:create")
  rails_command("db:migrate")
  rails_command("db:migrate", env: 'test')
end
