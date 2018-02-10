# copy_file 'config/environments/development.rb', force: true
# copy_file 'config/environments/production.rb', force: true
# copy_file 'config/environments/test.rb', force: true

copy_file 'config/application.rb', force: true
copy_file 'config/database.yml', force: true
copy_file 'config/initializers/generators.rb', force: true
copy_file 'config/initializers/logger.rb', force: true

# Replace $TEMPLATE with the proper project name
gsub_file 'config/application.rb', '$TEMPLATE', "#{@app_name}".gsub("-", "_").camelize
gsub_file 'config/database.yml', '$TEMPLATE', "#{@app_name}".gsub("-", "_").underscore

# Remove assets.rb if user didnt set --api switch during rails new
# remove_file 'config/initializers/assets.rb'
# remove_file 'config/initializers/cookies_serializer.rb'
# remove_file 'config/initializers/new_framework_defaults_5_1.rb'
