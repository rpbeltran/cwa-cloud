# README
1) Set up a cloud 9 instance and clone this repo
2) Commands needed to set up environment:
    - curl -sL https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo
    - sudo yum install yarn
    - sudo yum install postgresql94 postgresql94-server postgresql94-devel 
    - sudo -su ec2-user
    - sudo service postgresql94 initdb
    - sudo service postgresql94 start
    - sudo su postgres
        - createuser ec2-user -dslP
        - exit
    - sudo -u postgres psql
        - create database cwa_cloud_development owner="ec2-user";
        - create database cwa_cloud_test owner="ec2-user";
        - \q
    - bundle imstall
    - rake db:migrate
    - rake db:seed
3) To start application:
    - rails s -p $PORT -b $IP
4) To install rspec on cloud 9:
    - rails g rspec:install
5) To run cucumber
    - rake cucumber
6) To run rspec
    - rspec
    
## Writing new rspec tests 
Each controller has it's own rspec file, found in cwa-cloud/spec
Good crash course on rspec: https://semaphoreci.com/community/tutorials/getting-started-with-rspec

## Writing new cucumber tests
Frankly I'm confused about how cucumber works, here's an article: http://railscasts.com/episodes/155-beginning-with-cucumber

Here is an additional resource; I haven't fully finished reading it yet, but it seems a bit more helpful: https://www.guru99.com/introduction-to-cucumber.html

- You can skip the installation steps 1 - 4, but 5 - 10 show you how to setup cucumber tests 
- Run this command to install a headless chrome binary: 
    curl https://intoli.com/install-google-chrome.sh | bash
