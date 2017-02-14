# config valid only for current version of Capistrano
lock '3.7.2'

set :application, 'rails-capistrano-test'
set :repo_url, 'git@github.com:tomo42695/chat-space.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/chatspace_keypair.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "~/.rbenv/shims:~/.rbenv/bin:$PATH",
  ACCESS_KEY_ID: ENV["ACCESS_KEY_ID"],
        SECRET_ACCESS_KEY: ENV["SECRET_ACCESS_KEY"]
}
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :sidekiq_queue, :carrierwave

set :assets_roles, [:web, :app]

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
