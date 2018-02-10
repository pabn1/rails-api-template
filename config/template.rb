copy_file 'config/application.rb', force: true
copy_file 'config/database.yml', force: true
copy_file 'config/initializers/generators.rb', force: true
copy_file 'config/initializers/logger.rb', force: true

copy_file 'config/environments/development.rb', force: true
copy_file 'config/environments/production.rb', force: true
copy_file 'config/environments/test.rb', force: true

# Replace $TEMPLATE with the proper project name
gsub_file 'config/application.rb', '$TEMPLATE', "#{@app_name}".gsub("-", "_").camelize
gsub_file 'config/database.yml', '$TEMPLATE', "#{@app_name}".gsub("-", "_").underscore
