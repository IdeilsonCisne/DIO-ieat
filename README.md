## README

### Projeto em Construção
* Projeto proposto pela digital innovation one do curso Da arquitetura ao deploy com Ruby, link do código original: https://github.com/fpgentil/ieat
* Proposta do projeto seria uma e-commerce de alimentação 

### Config
* ruby 2.7.2
* Rails 6.1.3.1
* Redis 6.0
* Sedekiq 6.1

### Install devise
* rails generate devise:install

### Install yarn
* sudo npm install --global yarn
* rails webpacker:install

### Check installation
* yarn --version
* npm --version
* rails  --version
* redis-server --version

### Command build docker
* docker build -t dio_ieat .

### Command for execute sidekiq
* bundle exec sidekiq