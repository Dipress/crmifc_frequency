set :deploy_to, "/var/www/apps/crm_frequency"

set :port, 22
set :user, 'deploy'
set :deploy_via, :remote_cache
set :use_sudo, false

server '194.54.152.50',
  roles: [:web, :app, :db],
  port: fetch(:port),
  user: fetch(:user),
  primary: true

set :ssh_options, {
	user: 'deploy',
	keys: %w(/home/deploy/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :rails_env, :production
set :conditionally_migrate, true