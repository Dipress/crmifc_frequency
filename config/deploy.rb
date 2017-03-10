# config valid only for current version of Capistrano
lock "3.7.2"

set :rvm_type, :system
set :rvm_ruby_version, '2.4.0@crm_frequency-rails5'
set :rvm_roles, [:app, :web]

set :repo_url, "git@github.com:Supro/crmifc_frequency.git"
set :branch, 'master'


set :rails_env, 'production'
set :migration_role, :db
set :migration_servers, -> { primary(fetch(:migration_role)) }
set :conditionally_migrate, true

set :assets_roles, [:app, :web]

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/mongoid.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/uploads'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :tmp_dir, "/home/deploy/tmp"

before "deploy:assets:precompile"
after "deploy", "deploy:cleanup"
after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
