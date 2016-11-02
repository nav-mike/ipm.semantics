[ ![Codeship Status for nav-mike/ipm.semantics](https://app.codeship.com/projects/8c692e70-6b87-0134-d5a6-6efe74dd2a57/status?branch=master)](https://app.codeship.com/projects/176963)

[ ![Waffle.io board for nav-mike/ipm.semantics](https://img.shields.io/badge/board-show-blue.svg)](https://waffle.io/nav-mike/ipm.semantics)

## Run application on virtual machine

### Requirements

* Vagrant
* VirtualBox
* Ansible

### Preparation of the application

* Up & Running (first and subsequent runs) `vagrant up`
* SSH into this machine `vagrant ssh`
* Shut down `vagrant halt`
* Destroying the virtual machine `vagrant destroy`

### Starting up rails server

`cd semantics && bundle exec rails s -b 0.0.0.0 -p 3000`

### Deploy

`bundle exec cap production deploy`

`bundle exec cap production:restart`

### lod.ifmo.ru

More: http://rus-lod.herokuapp.com

### Additional info
restart puma: bundle exec pumactl -P ~/apps/semantics/shared/tmp/pids/puma.pid restart


http://ruby-journal.com/how-to-setup-rails-app-with-puma-and-nginx/

https://www.digitalocean.com/community/tutorials/deploying-a-rails-app-on-ubuntu-14-04-with-capistrano-nginx-and-puma
